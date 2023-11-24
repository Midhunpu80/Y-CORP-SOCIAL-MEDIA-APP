import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/main.dart';
import 'package:social_syn/view/screen/authentication/Log/reg/registerpage.dart';
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
              height: 6.h,
            ),
            Container(
              height: 20.h,
              width: 40.w,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("images/login.png"), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(50.h),
                  color: blu),
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
            Row(
              children: [
                SizedBox(
                  height: 8.h,
                  width: 50.w,
                  child: Obx(
                    () => ListTile(
                      leading: Radio(
                          value: 1,
                          groupValue: procontroll.gropdata.value,
                          onChanged: (val) {
                            data = 1;
                            print(data.toString());
                            procontroll.changeraio_value(val: val);
                          }),
                      title: alltext(
                          txt: "Home owner",
                          col: wh,
                          siz: 8.sp,
                          wei: FontWeight.bold,
                          max: 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.h,
                  width: 50.w,
                  child: Obx(
                    () => ListTile(
                      leading: Radio(
                          value: 2,
                          groupValue: procontroll.gropdata.value,
                          onChanged: (val) {
                            data = 2;
                            print(data.toString());

                            procontroll.changeraio_value(val: val);
                          }),
                      title: alltext(
                          txt: "Proffessional",
                          col: wh,
                          siz: 8.sp,
                          wei: FontWeight.bold,
                          max: 1),
                    ),
                  ),
                ),
              ],
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
                  if (procontroll.gropdata.value == 0) {
                    print("selete the something ");
                  }
                  if (email_log.text.isEmpty && password_log.text.isEmpty) {
                    print("is empty");
                  } else if (email_log.text.isNotEmpty &&
                      password_log.text.isNotEmpty) {
                    log_controll.login_services(
                        email: email_log.text, password: password_log.text);
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
                  onTap: () {
                    Get.to(() => Registerpagescreen());
                  },
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
