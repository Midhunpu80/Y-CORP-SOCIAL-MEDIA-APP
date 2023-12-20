import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/main.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

reporttheuser(
    {required BuildContext context,
    required var name,
    required var profile,
    required var id}) {
  // ignore: unused_local_variable
  final gpcontroller = TextEditingController();

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Padding(
            padding: EdgeInsets.only(left: 26.h),
            child: CircleAvatar(
                radius: 2.h,
                backgroundColor: wh,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                      // usercont.img.value!.clear();
                    },
                    icon: Icon(
                      Icons.close,
                      color: re,
                      size: 2.h,
                    ))),
          ),
          backgroundColor: bl,
          content: Container(
            height: 40.h,
            width: 120.w,
            decoration: BoxDecoration(
                // border: Border.all(width: 1, color: yl),
                borderRadius: BorderRadius.circular(1.h)),
            // ignore: prefer_const_constructors
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 6.h,
                    backgroundColor: yl,
                    child: Icon(
                      Icons.report,
                      color: re,
                      size: 8.h,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  TextFormField(
                    controller: gpcontroller,
                    style: TextStyle(color: wh),
                    decoration: InputDecoration(
                        hintText: "write the reason ....",
                        hintStyle: TextStyle(color: wh),
                        prefixIcon: Icon(
                          Icons.person_2,
                          color: wh,
                        ),
                        border: const OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                    onTap: () async {
                      reportcontroll.report(
                          name: name,
                          profile: profile,
                          id: id,
                          reason: gpcontroller.text);
                      Get.back();

                      Get.back();
                    },
                    child: Container(
                        height: 6.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.h),
                            color: re),
                        child: Center(
                          child: alltext(
                              txt: "Report",
                              col: wh,
                              siz: 12.sp,
                              wei: FontWeight.bold,
                              max: 1),
                        )),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
