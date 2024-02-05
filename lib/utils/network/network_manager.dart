// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

//Manage the network connectivity status

  // final Connectivity _connectivity = Connectivity();
  // late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  // final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  //intionalize the network manager

  // void onInit() {
  //   super.onInit();
  //   _connectivitySubscription =
  //       _connectivity.onConnectivityChanged.listen(_upateConnectionStatus);
  // }

  //Update connection
  // Future<Void> _upateConnectionStatus(ConnectivityResult result) async {
  //   _connectionStatus.value = result;
  //   if(_connectionStatus.value==ConnectivityResult.none){

  //   }
  // }

  //Check internet connection status
}
