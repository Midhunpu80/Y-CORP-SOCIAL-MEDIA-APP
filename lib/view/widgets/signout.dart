import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_syn/main.dart';

freedialogs(
    {required BuildContext context,
    required var tit,
    required var des,
    required DialogType type}) {
  return AwesomeDialog(
    context: context,
    dialogType: type,
    animType: AnimType.rightSlide,
    title: tit,
    desc: des,
    btnCancelOnPress: () {
      Get.back();
    },
    btnOkOnPress: () {
      auth_controll.logout(context: context);
    },
  )..show();
}
