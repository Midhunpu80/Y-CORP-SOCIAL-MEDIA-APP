import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/main.dart';
import 'package:social_syn/view/screen/bottomnavigation/bottomnavigation.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/registertextfields.dart';

class Loginscreen extends StatelessWidget {
  final email_log = TextEditingController();
  final password_log = TextEditingController();

  ///const Loginscreen({super.key});

  var data = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bl,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
            Container(
              height: 20.h,
              width: 40.w,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage(
                          "images/3645-7621-remix-of-login-machine.png"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(50.h),
                  color: wh),
            ),
            SizedBox(
              height: 3.h,
            ),
            alltext(
                txt: "LOGIN",
                col: wh,
                siz: 18.sp,
                wei: FontWeight.bold,
                max: 1),
            SizedBox(
              height: 6.h,
            ),
            SizedBox(
              height: 1.h,
            ),
            alltextfields(
                controller: email_log,
                ico: Icons.lock,
                hint: "enter your email id",
                labl: "Email ID"),
            SizedBox(
              height: 3.h,
            ),
            alltextfields(
                controller: password_log,
                icos: Icons.remove_red_eye,
                ico: Icons.location_on,
                hint: "enter your password",
                labl: "Password"),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: alltext(
                        txt: "Forget password",
                        col: re,
                        siz: 8.sp,
                        wei: FontWeight.bold,
                        max: 1)),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  if (email_log.text.isNotEmpty ||
                      password_log.text.isNotEmpty) {
                    auth_controll.loginuserservice(
                        email: email_log.text.toString(),
                        password: password_log.text.toString());
                  } else {
                    print("is empty");
                  }
                },
                child: Container(
                  height: 6.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.h), color: or
                      // border: Border.all(width: 1, color: or),
                      ),
                  child: Center(
                    child: alltext(
                        txt: "LOGIN",
                        col: wh,
                        siz: 11.sp,
                        wei: FontWeight.bold,
                        max: 1),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Align(
                alignment: Alignment.center,
                child: SizedBox(
                    child: alltext(
                        txt: "or",
                        col: wh,
                        siz: 12.sp,
                        wei: FontWeight.bold,
                        max: 1))),
            SizedBox(
              height: 2.h,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Get.to(() => Loginscreen());
                },
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 6.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.h), color: blu
                        //border: Border.all(width: 1, color: blu),
                        ),
                    child: Center(
                      child: alltext(
                          txt: "SIGN UP",
                          col: wh,
                          siz: 11.sp,
                          wei: FontWeight.bold,
                          max: 1),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            alltext(
                txt: "if you dont have any account create an account",
                col: wh,
                siz: 8.sp,
                wei: FontWeight.bold,
                max: 1),
          ],
        ),
      ),
    );
  }
}
