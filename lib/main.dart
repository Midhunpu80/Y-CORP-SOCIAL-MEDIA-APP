// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/controller/bottomcontroller.dart';
import 'package:social_syn/controller/protabcontroller.dart';
import 'package:social_syn/view/screen/bottomnavigation/bottomnavigation.dart';
import 'package:social_syn/view/service/authentication/login.dart';
import 'package:social_syn/view/service/authentication/regowner.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

final bottomct = Get.put(bottomcontroller());
final procontroll = Get.put(protabcontroller());
final log_controll = Get.put(login_service());

final regowner_controll = Get.put(regowner_service());
// final getposts_controll = Get.put(allposts_service());
// final question_controll = Get.put(allquestion_service());
// final require_controll = Get.put(allreuirement_service());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter DemHo',
          theme: ThemeData(
            fontFamily: GoogleFonts.inter().fontFamily,
            colorScheme: ColorScheme.fromSeed(seedColor: blu),
            useMaterial3: true,
          ),
          home: Scaffold(body: bottomnavscreen()));
    });
  }
}

var clipdropapi =
    "460dd433ed59767ebc37e60530d2a23c7be1efca7dc5210eff9566a57bd49e69f0fecfd3a29f16207852dffd84a46cd6";
