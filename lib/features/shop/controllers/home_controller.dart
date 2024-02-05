import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  final carousalCurrentIndex = 0.obs;

  // ignore: non_constant_identifier_names
  void UpdatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
}
