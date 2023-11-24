import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/main.dart';
import 'package:social_syn/view/screen/authentication/Loginscreen/loginscreen.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/registertextfields.dart';

class owner_registerscreen extends StatelessWidget {
  final email_reg = TextEditingController();
  final password_reg = TextEditingController();
  final phone_reg = TextEditingController();
  final location_reg = TextEditingController();
  final name_reg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bl,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: SizedBox(
                child: alltext(
                    txt: " OWNER SIGNUP",
                    col: blu,
                    siz: 18.sp,
                    wei: FontWeight.bold,
                    max: 1),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: SizedBox(
                child: alltext(
                    txt: "  Welcome Back",
                    col: gy,
                    siz: 12.sp,
                    wei: FontWeight.w400,
                    max: 1),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 3.h),
              child: Container(
                height: 50.h,
                width: 88.w,
                child: Column(
                  children: [
                    alltextfields(
                        controller: name_reg,
                        ico: Icons.person,
                        labl: " User Name",
                        hint: "enter your name"),
                    SizedBox(
                      height: 2.h,
                    ),
                    alltextfields(
                        controller: email_reg,
                        ico: Icons.email,
                        hint: "enter your email",
                        labl: "Email ID"),
                    SizedBox(
                      height: 2.h,
                    ),
                    alltextfields(
                        controller: phone_reg,
                        ico: Icons.phone,
                        hint: "enter your phone number",
                        labl: "Phone"),
                    SizedBox(
                      height: 2.h,
                    ),
                    alltextfields(
                        controller: password_reg,
                        icos: Icons.remove_red_eye,
                        ico: Icons.lock,
                        hint: "enter your password",
                        labl: "Password"),
                    SizedBox(
                      height: 2.h,
                    ),
                    alltextfields(
                        controller: location_reg,
                        ico: Icons.location_on,
                        hint: "enter your current loaction",
                        labl: "Location"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  regowner_controll.registerowner_services(
                      name: name_reg.text,
                      phone: phone_reg.text,
                      email: email_reg.text,
                      password: password_reg.text,
                      location: location_reg.text);
                },
                child: Container(
                  height: 6.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.h),
                    border: Border.all(width: 2, color: blu),
                  ),
                  child: Center(
                    child: alltext(
                        txt: "SIGN UP",
                        col: wh,
                        siz: 12.sp,
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
                child: Container(
                  height: 6.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.h),
                    border: Border.all(width: 2, color: or),
                  ),
                  child: Center(
                    child: alltext(
                        txt: "LOGIN",
                        col: wh,
                        siz: 12.sp,
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
                        txt: "if you alredy have an account Login",
                        col: wh,
                        siz: 10.sp,
                        wei: FontWeight.bold,
                        max: 1))),
          ],
        ),
      ),
    );
  }
}
