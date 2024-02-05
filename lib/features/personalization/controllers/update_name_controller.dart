import 'package:ecommerce_app/common/widgets/loaders/open_loading_dialog.dart';
import 'package:ecommerce_app/data/repositories/user/user_repositories.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/features/personalization/screens/profile/profile.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/loaders/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNamrController extends GetxController {
  static UpdateNamrController get instance => Get.find();
  final firstName = TextEditingController();
  final lastname = TextEditingController();

  final userController = UserController.instance;
  final userRepositoriy = Get.put(UserRepositoriy());

  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  //fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastname.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'We are updating your info', TImages.user);

      // Form validation
      if (updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
      }

      //Update user first and last name
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastname.text.trim(),
      };
      await userRepositoriy.updateSingleField(name);

      //Upadte the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastname.text.trim();

      //Remove Loader
      TFullScreenLoader.stopLoading();

      //show Success Messege
      TLoaders.successSnakbar(
          Title: 'Congrulation', messege: 'Your info hass been updated');

      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnak(Title: 'Oh snap', messege: e.toString());
    }
  }
}
