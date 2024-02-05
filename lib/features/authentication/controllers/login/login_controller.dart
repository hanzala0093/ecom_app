// ignore_for_file: unused_local_variable

import 'package:ecommerce_app/common/widgets/loaders/open_loading_dialog.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/loaders/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/repositories/authencation_repositories.dart';

class LoginController extends GetxController {
  //variables
  final rememberMe = false.obs;
  final hidePassword = false.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  //Email and password singin

  Future<void> emailAndPasswordSignin() async {
    try {
      //Signin loading
      TFullScreenLoader.openLoadingDialog('Loging you in', TImages.acerlogo);

      //Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
      }

      //login user using email and password
      final userCredentials = await AnthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Remove Loader
      TFullScreenLoader.stopLoading();

      AnthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnak(Title: 'Oh snap', messege: e.toString());
    }
  }
}
