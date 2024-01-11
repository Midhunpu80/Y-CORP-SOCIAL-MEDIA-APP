import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_syn/view/utility/colors.dart';

customsnackbar(
    {BuildContext? context,
    required var titile,
    required var messege,
    required ContentType type}) async {
  final snack = Get.rawSnackbar(
    ///duration: const Duration(seconds: 5),
    backgroundColor: gr,
    title: titile,
    message: messege,
  );
  return snack;

}
