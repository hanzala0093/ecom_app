import 'package:ecommerce_app/utils/network/network_manager.dart';
import 'package:get/get.dart';

class GenralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
