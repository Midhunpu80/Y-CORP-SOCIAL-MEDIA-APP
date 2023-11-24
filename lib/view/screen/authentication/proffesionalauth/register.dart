// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/view/screen/authentication/Loginscreen/loginscreen.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/registertextfields.dart';

class proffessional_registerscreen extends StatelessWidget {
  const proffessional_registerscreen({super.key});

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
            Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: SizedBox(
                child: alltext(
                    txt: "PROFESSIONAL SIGNUP",
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
              padding: EdgeInsets.only(left: 2.h),
              child: Container(
                height: 55.h,
                width: 88.w,
                child: Column(
                  children: [
                    alltextfields(
                        ico: Icons.person,
                        labl: " User Name",
                        hint: "enter your name"),
                    SizedBox(
                      height: 2.h,
                    ),
                    alltextfields(
                        ico: Icons.email,
                        hint: "enter your email",
                        labl: "Email ID"),
                    SizedBox(
                      height: 2.h,
                    ),
                    alltextfields(
                        ico: Icons.phone,
                        hint: "enter your phone number",
                        labl: "Phone"),
                    SizedBox(
                      height: 2.h,
                    ),
                    alltextfields(
                        icos: Icons.remove_red_eye,
                        ico: Icons.lock,
                        hint: "enter your password",
                        labl: "Password"),
                    SizedBox(
                      height: 2.h,
                    ),
                    alltextfields(
                        ico: Icons.expand_circle_down_sharp,
                        hint: "enter your current experience",
                        labl: "Experience"),
                    SizedBox(
                      height: 2.h,
                    ),

                    // SizedBox(
                    //   height: 2.h,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 25.h,
                          child: alltextfields(
                              ico: Icons.location_on,
                              hint: "enter your current loaction",
                              labl: "Location"),
                        ),
                        SizedBox(
                          width: 4.h,
                        ),
                        Container(
                          height: 6.h,
                          width: 25.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1.h),
                              border: Border.all(width: 1, color: blu)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Center(
                                child: alltext(
                                    txt: "cateogerory",
                                    col: blu,
                                    siz: 7.sp,
                                    wei: FontWeight.bold,
                                    max: 1),
                              ),
                              Icon(
                                Icons.arrow_drop_down_circle,
                                color: wh,
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Align(
              alignment: Alignment.center,
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
