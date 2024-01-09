import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/main.dart';
import 'package:social_syn/view/screen/authentication/ownerauth.dart/register.dart';
import 'package:social_syn/view/screen/authentication/resetpasswordscreen/resetpass.dart';
import 'package:social_syn/view/screen/bottomnavigation/bottomnavigation.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/registertextfields.dart';

class Loginscreen extends StatelessWidget {
  final Loginkey = GlobalKey<FormState>();

  final email_log = TextEditingController();
  final password_log = TextEditingController();

  ///const Loginscreen({super.key});

  var data = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 12.h,
        title: CircleAvatar(
          radius: 4.h,
          backgroundImage: AssetImage("images/y-high-resolution-logo.png"),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.close,
              color: wh,
            )),
        backgroundColor: bl,
      ),
      backgroundColor: bl,
      body: SingleChildScrollView(
        child: Form(
          key: Loginkey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 2.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    child: alltext(
                        txt:
                            "To get started,first enter \n your email address or\n password",
                        col: wh,
                        siz: 18.sp,
                        wei: FontWeight.bold,
                        max: 3),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              alltextfields(
                  messege: "please enter your email id ",
                  controller: email_log,
                  ico: Icons.lock,
                  hint: "enter your email id",
                  labl: "Email ID", obsz: false),
              SizedBox(
                height: 3.h,
              ),
              Obx(() => alltextfields(
                  messege: "please enter your password",
                  controller: password_log,
                  icos: bottomct.obs.value
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined,
                  ico: Icons.location_on,
                  hint: "enter your password",
                  labl: "Password", obsz: bottomct.obs.value)),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                height: 2.h,
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    if (Loginkey.currentState!.validate()) {
                      if (email_log.text.isNotEmpty ||
                          password_log.text.isNotEmpty) {
                        auth_controll.loginuserservice(
                            email: email_log.text.toString(),
                            password: password_log.text.toString());
                      } else {
                        print("is empty");
                      }
                    } else {}
                  },
                  child: Container(
                    height: 6.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18.h), color: wh
                        // border: Border.all(width: 1, color: or),
                        ),
                    child: Center(
                      child: alltext(
                          txt: "LOGIN",
                          col: bl,
                          siz: 11.sp,
                          wei: FontWeight.bold,
                          max: 1),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      child: alltext(
                          txt: "OR",
                          col: wh,
                          siz: 12.sp,
                          wei: FontWeight.bold,
                          max: 1))),
              SizedBox(
                height: 1.h,
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Get.to(() => Loginscreen());
                  },
                  child: InkWell(
                    onTap: () {
                      Get.to(() => owner_registerscreen());
                    },
                    child: Container(
                      height: 6.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.h), color: wh
                          //border: Border.all(width: 1, color: blu),
                          ),
                      child: Center(
                        child: alltext(
                            txt: "SIGN UP",
                            col: bl,
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
                  siz: 9.sp,
                  wei: FontWeight.bold,
                  max: 1),
              Padding(
                padding: EdgeInsets.only(
                  top: 18.h,
                ),
                child: InkWell(
                  onTap: () {
                    Get.to(() => resertpassscreen());
                  },
                  child: Container(
                      height: 5.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: wh),
                          borderRadius: BorderRadius.circular(18.h)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: alltext(
                                txt: "Forget password",
                                col: wh,
                                siz: 11.sp,
                                wei: FontWeight.bold,
                                max: 1)),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
