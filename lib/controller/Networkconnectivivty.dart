import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

class network_controller extends GetxController {
  final Connectivity _connectivity = Connectivity();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _connectivity.onConnectivityChanged.listen(upateconnectstatus);
  }

  upateconnectstatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      Get.rawSnackbar(
          messageText: alltext(
              txt: "PLASE CONNECT TO INTERNET",
              col: wh,
              siz: 12.sp,
              wei: FontWeight.bold,
              max: 1),
          isDismissible: false,
          duration: Duration(days: 1),
          backgroundColor: re,
          icon: Icon(
            Icons.wifi_off,
            color: wh,
          ),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED);
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeAllSnackbars();
      }
    }
  }
}
