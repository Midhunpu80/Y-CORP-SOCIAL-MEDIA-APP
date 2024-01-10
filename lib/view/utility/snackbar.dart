import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

customsnackbar(
    {BuildContext? context,
    required var titile,
    required var messege,
    required ContentType type}) async {
  final snack = SnackBar(

      ///duration: const Duration(seconds: 5),
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: "name",
        message: "game ",
        contentType: type,
      ));
  return ScaffoldMessenger.of(context!)
    ..hideCurrentSnackBar()
    ..showSnackBar(snack);
}
