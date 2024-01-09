// ignore_for_file: non_constant_identifier_names

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
  final last_reg = TextEditingController();
  final name_reg = TextEditingController();
  final regkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 10.h,
        title: CircleAvatar(
          radius: 4.h,
          backgroundImage:const  AssetImage("images/y-high-resolution-logo.png"),
        ),
        backgroundColor: bl,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.close,
              color: wh,
            )),
      ),
      backgroundColor: bl,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 4.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: SizedBox(
                child: alltext(
                    txt: " USER SIGNUP",
                    col: wh,
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
              child: SizedBox(
                height: 50.h,
                width: 88.w,
                child: Column(
                  children: [
                    alltextfields(
                        messege: "Please enter your first name ",
                        controller: name_reg,
                        ico: Icons.person,
                        labl: "First Name",
                        hint: "enter your First name",
                        obsz: false),
                    SizedBox(
                      height: 2.h,
                    ),
                    alltextfields(
                        messege: "Please enter your Last name ",
                        controller: last_reg,
                        ico: Icons.verified_user_outlined,
                        hint: "Last Name",
                        labl: "Last Name",
                        obsz: false),
                    SizedBox(
                      height: 2.h,
                    ),
                    alltextfields(
                        messege: "Please enter your phone number ",
                        controller: phone_reg,
                        ico: Icons.phone,
                        hint: "enter your phone number",
                        labl: "Phone",
                        obsz: false),
                    SizedBox(
                      height: 2.h,
                    ),
                    alltextfields(
                        messege: "Please enter your email address ",
                        controller: email_reg,
                        icos: null,
                        ico: Icons.email,
                        hint: "enter your Email",
                        labl: "Email",
                        obsz: false),
                    SizedBox(
                      height: 2.h,
                    ),
                    alltextfields(
                        messege: "Please enter your password ",
                        controller: password_reg,
                        ico: Icons.location_on,
                        hint: "enter your password",
                        labl: "Password",
                        obsz: false),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  //  if (regkey.currentState!.validate()) {
                  if (email_reg.text.isNotEmpty ||
                      password_reg.text.isNotEmpty | name_reg.text.isNotEmpty ||
                      last_reg.text.isNotEmpty ||
                      phone_reg.text.isNotEmpty) {
                    auth_controll.singunupemailandpassword(
                        email: email_reg.text,
                        password: password_reg.text,
                        name: name_reg.text,
                        lastname: last_reg.text,
                        phone: phone_reg.text);
                    Get.to(() => Loginscreen());
                    // }
                  }
                },
                child: Container(
                  height: 5.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: wh,
                    borderRadius: BorderRadius.circular(100.h),
                    border: Border.all(width: 2, color: wh),
                  ),
                  child: Center(
                    child: alltext(
                        txt: "SIGN UP",
                        col: bl,
                        siz: 12.sp,
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
                        txt: "or",
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
                child: Container(
                  height: 5.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    color: wh,
                    borderRadius: BorderRadius.circular(100.h),
                    border: Border.all(width: 2, color: bl),
                  ),
                  child: Center(
                    child: alltext(
                        txt: "LOGIN",
                        col: bl,
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
