import 'package:ecommerce_app/app.dart';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'data/repositories/authencation_repositories.dart';

Future<void> main() async {
  //Add widgets binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  //Add init local storage
  await GetStorage.init();
  //Add init payment methods
  //Add Await native splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //Add Intinalize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AnthenticationRepository()),
  );

  //Add Intinalize Authentication

  runApp(const App());
}
