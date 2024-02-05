import 'package:ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/verify_emial.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AnthenticationRepository extends GetxController {
  static AnthenticationRepository get instance => Get.find();
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //Get user Authencated data

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }

  //Register

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  //Mail Verification

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } catch (e) {
      throw 'Somethind wents wrong';
    }
  }

  //Login

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  //logout

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw 'Something wents erong';
    }
  }
}
