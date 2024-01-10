import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/main.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/registertextfields.dart';

class resertpassscreen extends StatelessWidget {
  resertpassscreen({super.key});
  final resetcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: bl,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 3.h,
              backgroundImage:
                  const AssetImage("images/y-high-resolution-logo.png"),
            ),
          ),
        ],
        centerTitle: true,
        toolbarHeight: 12.h,
        title: alltext(
            txt: "Reset Password",
            col: wh,
            siz: 13.sp,
            wei: FontWeight.bold,
            max: 1),
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
      body: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: alltextfields(
                  controller: resetcontroller,
                    obsz: false,
                    messege: "enter the email address",
                    ico: Icons.email,
                    hint: "Enter your email address",
                    labl: "email address"),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            InkWell(
              onTap: () {
                auth_controll.reserpassword(
                    email: resetcontroller.text.toString());
              },
              child: Container(
                height: 5.h,
                width: 80.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.h), color: wh),
                child: Center(
                    child: alltext(
                        txt: " Reset password",
                        col: bl,
                        siz: 11.sp,
                        wei: FontWeight.bold,
                        max: 1)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
