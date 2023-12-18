import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_syn/main.dart';
import 'package:social_syn/view/service/groupchat/groupchatservice.dart';

class groupcontrollerss extends GetxController {
  Future createnewgp({required var gname, required var file}) async {
   groupchatservice gp = groupchatservice();
    String resp = await gp.creategroup(gname: gname, file: file);
    try {
      if (resp == "sucess") {
        Get.snackbar("sucess", "sucess");
      } else {
        Get.snackbar("failed", "failed");
      }
    } catch (e) {
      Get.snackbar(e.toString(), "failed");
    }
  }
}
