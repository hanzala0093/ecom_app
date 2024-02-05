import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TLoaders {
  static hideSnakBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required messege}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: THelperFunctions.isDarkMode(Get.context!)
                ? TColors.darkGrey.withOpacity(0.9)
                : TColors.grey.withOpacity(0.9),
          ),
          child: Center(
            child: Text(
              messege,
              style: Theme.of(Get.context!).textTheme.labelLarge,
            ),
          ),
        )));
  }

  static warnigSnakbar({required Title, messege = ''}) {
    Get.snackbar(Title, messege,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: TColors.white,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Iconsax.warning_2,
          color: TColors.white,
        ));
  }

  static successSnakbar({required Title, messege = ''}) {
    Get.snackbar(Title, messege,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: TColors.white,
        backgroundColor: TColors.primary,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Iconsax.warning_2,
          color: TColors.white,
        ));
  }

  static errorSnak({required Title, messege = ''}) {
    Get.snackbar(Title, messege,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: TColors.white,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Iconsax.warning_2,
          color: TColors.white,
        ));
  }
}
