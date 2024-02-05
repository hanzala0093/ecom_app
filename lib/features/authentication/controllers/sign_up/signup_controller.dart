import 'package:ecommerce_app/common/widgets/loaders/open_loading_dialog.dart';
import 'package:ecommerce_app/data/repositories/user/user_repositories.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/verify_emial.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/loaders/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authencation_repositories.dart';
import '../../models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //Variables

  final hidePassword = true.obs;
  final privacyPoliecy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //Sign up

  void signup() async {
    try {
      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your info...', TImages.verifyIllustration);

      //Check Internet connectivity
      //final isConnected=await NetworkManager

      //Form Validation
      if (!signupFormKey.currentState!.validate()) {
        // ignore: null_argument_to_non_null_type
        TFullScreenLoader.stopLoading();
        return;
      }

      //Privacy check
      if (!privacyPoliecy.value) {
        TLoaders.warnigSnakbar(
            Title: 'Accept privacy poliecy',
            messege:
                'In order to create account, you must accept the Privacy Poliecy and terms and conditions');
        return;
      }

      //Register user in fire base
      final userCredential = await AnthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //Save Authencated data
      final userNew = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          userName: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepositoriy = Get.put(UserRepositoriy());
      await userRepositoriy.saveUserRecord(userNew);
      TFullScreenLoader.stopLoading();

      //Show success messege
      TLoaders.successSnakbar(
          Title: 'Congrulations',
          messege: 'Your account has been created! verify your email');

      //Move to verify email screen
      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnak(Title: 'oh Snap', messege: e.toString());
    }
  }
}
