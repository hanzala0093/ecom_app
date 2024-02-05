import 'package:ecommerce_app/data/repositories/user/user_repositories.dart';
import 'package:ecommerce_app/features/authentication/models/user_model.dart';
import 'package:ecommerce_app/utils/loaders/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  //final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final userRepositoriy = Get.put(UserRepositoriy());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      //profileLoading.value = true;
      final user = await userRepositoriy.fetchUserDetial();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
      // } finally {
      //   profileLoading.value = true;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        //conver name to first and last name
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? '');

        final userName =
            UserModel.generateUserName(userCredential.user!.displayName);

        //Map Data
        final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            userName: userName,
            email: userCredential.user!.phoneNumber ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '');
        //save user data

        await Get.put(UserRepositoriy()).saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warnigSnakbar(
          Title: 'Data not saved',
          messege:
              'something wents wrong while saving your information. You can re-save your data in your profile');
    }
  }

  uploadUserProfilePicture() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
      maxHeight: 512,
      maxWidth: 512,
    );

    if (image != null) {
      // Corrected reference to UserController.instance.userRepositoriy
      final imageUrl = await UserController.instance.userRepositoriy
          .uploadImage('Users/Images/Profile', image);

      Map<String, dynamic> json = {'ProfilePicture': imageUrl};

      // Assuming this method exists in your UserRepositoriy
      await UserController.instance.userRepositoriy.updateSingleField(json);

      // Assuming the UserModel class has a property called ProfilePicture
      UserController.instance.user.value.profilePicture = imageUrl;
    }
  }
}

//Save record from any registration provider
