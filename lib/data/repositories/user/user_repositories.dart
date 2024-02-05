import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/authentication/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../authencation_repositories.dart';

class UserRepositoriy extends GetxController {
  static UserRepositoriy get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } catch (e) {
      throw 'Somethings wents wrong';
    }
  }

  //Function to fetch user detials based on user Id
  Future<UserModel> fetchUserDetial() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AnthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } catch (e) {
      throw 'Somethings wents wrong';
    }
  }

  //Function to update data in firebase

  Future<void> updateUserDetial(UserModel updatedUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
    } catch (e) {
      throw 'Somethings wents wrong';
    }
  }

  //update any field in specfic User collection

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AnthenticationRepository.instance.authUser?.uid)
          .update(json);
    } catch (e) {
      throw 'Somethings wents wrong';
    }
  }

  //Function to remove user data from firebase
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } catch (e) {
      throw 'Somethings wents wrong';
    }
  }

  // Upload any image
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));

      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      throw 'Something wents wrong';
    }
  }
}
