import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/screen/authentication/ownerauth.dart/register.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

import '../../Loginscreen/loginscreen.dart';

class log_or_reg_screen extends StatelessWidget {
  const log_or_reg_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: 100.h,
      width: 100.w,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          bl,
          blu,
        ],
        end: Alignment.bottomRight,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                    child: alltext(
                        txt: "WELCOME TO THE  \nSOCIAL SYNC",
                        col: blu,
                        siz: 15.sp,
                        wei: FontWeight.bold,
                        max: 2))),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            height: 39.h,
            width: 95.w,
            child: Lottie.asset("images/reigster.json"),
          ),
          SizedBox(
            height: 7.h,
          ),
          alltext(
              txt: "CREATE AN ACCOUNT ",
              col: blu,
              siz: 12.sp,
              wei: FontWeight.bold,
              max: 1),
          SizedBox(
            height: 3.h,
          ),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                Get.to(() => owner_registerscreen());
              },
              child: Container(
                height: 6.h,
                width: 80.w,
                decoration: BoxDecoration(
                    color: blu,
                    borderRadius: BorderRadius.circular(1.h),
                    border: Border.all(width: 2, color: blu)),
                child: Center(
                  child: alltext(
                      txt: "Register",
                      col: wh,
                      siz: 11.sp,
                      wei: FontWeight.w800,
                      max: 1),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          alltext(txt: "or", col: wh, siz: 12.sp, wei: FontWeight.bold, max: 1),
          SizedBox(
            height: 3.h,
          ),
          InkWell(
            onTap: () {
              Get.to(() => Loginscreen());
            },
            child: Container(
              height: 6.h,
              width: 80.w,
              decoration: BoxDecoration(
                  color: or,
                  borderRadius: BorderRadius.circular(1.h),
                  border: Border.all(width: 2, color: or)),
              child: Center(
                child: alltext(
                    txt: "Login",
                    col: wh,
                    siz: 11.sp,
                    wei: FontWeight.w800,
                    max: 1),
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          alltext(
              txt: "if you already have an account Login",
              col: wh,
              siz: 9.sp,
              wei: FontWeight.w400,
              max: 1),
        ],
      ),
    ));
  }
}
