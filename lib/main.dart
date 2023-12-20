// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/controller/bottomcontroller.dart';
import 'package:social_syn/controller/chatcontroller.dart';
import 'package:social_syn/controller/postcontroller.dart';
import 'package:social_syn/controller/postsavedcontroller.dart';
import 'package:social_syn/controller/protabcontroller.dart';
import 'package:social_syn/controller/usercontroller%20.dart';
import 'package:social_syn/view/resources/storage.dart';
import 'package:social_syn/view/screen/authentication/Log/log/reg.dart';
import 'package:social_syn/view/screen/bottomnavigation/bottomnavigation.dart';
import 'package:social_syn/view/service/auth/firebaseauthentication.dart';
import 'package:social_syn/view/service/groupchat/groupchatservice.dart';
import 'package:social_syn/view/service/notification/notification_service.dart';
import 'package:social_syn/view/service/report/report_service.dart';
import 'package:social_syn/view/service/user.dart/profile.dart';

import 'package:social_syn/view/utility/colors.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

final auth_controll = Get.put(firebaseauthenticationservice());
final bottomct = Get.put(bottomcontroller());
final procontroll = Get.put(protabcontroller());
final profile_cont = profile_service();

final usercont = Get.put(usercontroller());
final storagecont = firbasestorage();
final postcont = Get.put(postcontroller());

final savedcont = Get.put(postdaved_controller());
final chatcont = Get.put(chatcontroller());
final gcontroll = Get.put(groupchatservice());
final reportcontroll = Get.put(report_service());
final notification_controll = Get.put(notification_service());

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
          initialBinding: BindingsBuilder(() {
            Get.put(usercontroller());
          }),
          debugShowCheckedModeBanner: false,
          title: 'Flutter DemHo',
          theme: ThemeData(
            fontFamily: GoogleFonts.novaSquare().fontFamily,
            colorScheme: ColorScheme.fromSeed(seedColor: blu),
            useMaterial3: true,
          ),
          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                return Scaffold(
                    body: snapshot.hasData
                        ? bottomnavscreen()
                        : const log_or_reg_screen());
              }));
    });
  }
}
