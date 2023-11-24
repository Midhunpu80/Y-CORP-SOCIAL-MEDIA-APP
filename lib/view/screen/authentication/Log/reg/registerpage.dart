import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/screen/authentication/Loginscreen/loginscreen.dart';
import 'package:social_syn/view/screen/authentication/ownerauth.dart/register.dart';
import 'package:social_syn/view/screen/authentication/proffesionalauth/register.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

class Registerpagescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bl,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                      child: alltext(
                          txt: "TO REGISTER IN   \nGUILD HUB",
                          col: blu,
                          siz: 17.sp,
                          wei: FontWeight.bold,
                          max: 2))),
            ),
            SizedBox(
              height: 35.h,
              width: 95.w,
              child: Lottie.asset("images/reigster.json"),
            ),
            SizedBox(
              height: 5.h,
            ),
            alltext(
                txt: "CREATE AN ACCOUNT ",
                col: blu,
                siz: 16.sp,
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
                      borderRadius: BorderRadius.circular(1.h),
                      border: Border.all(width: 2, color: blu)),
                  child: Center(
                    child: alltext(
                        txt: "Home Owner",
                        col: wh,
                        siz: 12.sp,
                        wei: FontWeight.w800,
                        max: 1),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            alltext(
                txt: "or", col: wh, siz: 12.sp, wei: FontWeight.bold, max: 1),
            SizedBox(
              height: 3.h,
            ),
            InkWell(
              onTap: () {
                // ignore: prefer_const_constructors
                Get.to(() => proffessional_registerscreen());
              },
              child: Container(
                height: 6.h,
                width: 80.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1.h),
                    border: Border.all(width: 2, color: or)),
                child: Center(
                  child: alltext(
                      txt: "Proffesional",
                      col: wh,
                      siz: 12.sp,
                      wei: FontWeight.w800,
                      max: 1),
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 9.h,
                ),
                alltext(
                    txt: "if you already have an account",
                    col: wh,
                    siz: 10.sp,
                    wei: FontWeight.w400,
                    max: 1),
                TextButton(
                  onPressed: () {
                    Get.to(() => Loginscreen());
                  },
                  child: alltext(
                      txt: "Login",
                      col: blu,
                      siz: 12.sp,
                      wei: FontWeight.w400,
                      max: 1),
                )
              ],
            )
          ],
        ));
  }
}
