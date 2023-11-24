import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

askquestionsheet(BuildContext context) {
  TextEditingController question_cont = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: wh,
          content: Container(
            color: wh,
            height: 40.h,
            width: 95.w,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          height: 15.h,
                          width: 28.w,
                          child: Center(
                              child: alltext(
                                  txt: "Write your\nThoughts",
                                  col: bl,
                                  siz: 15.sp,
                                  wei: FontWeight.bold,
                                  max: 2))),
                      Container(
                        height: 15.h,
                        width: 38.w,
                        child: Lottie.asset("images/ssk.json"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  textfield(controller: question_cont),
                  SizedBox(
                    height: 4.h,
                  ),
                  InkWell(
                    onTap: () {
                    
                      Get.back();
                    },
                    child: Container(
                      height: 6.h,
                      width: 65.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.h), color: or),
                      child: Center(
                        child: alltext(
                            txt: "Post Now",
                            col: wh,
                            siz: 12.sp,
                            wei: FontWeight.bold,
                            max: 1),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}

Widget textfield({required TextEditingController controller}) {
  return SizedBox(
    width: 65.w,
    child: TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: const InputDecoration(
          hintText: "write your Thoughts are", border: OutlineInputBorder()),
    ),
  );
}
