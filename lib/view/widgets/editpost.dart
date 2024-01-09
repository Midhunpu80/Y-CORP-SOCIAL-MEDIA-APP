import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/main.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

edituserpost(
    {required BuildContext context,
    required var textx,
    required var image,
    required var postid}) {
  final editcontroller = TextEditingController(text: textx.toString());

  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: bl,
          content: SizedBox(
            height: 50.h,
            width: 100.w,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 30.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(image.toString()),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 10.h,
                    width: 100.w,
                    child: TextFormField(
                      style: TextStyle(color: wh),
                      controller: editcontroller,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: wh),
                          hintText: "write something ",
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      postser.editposts(
                          postid: postid,
                          newcaption: editcontroller.text.toString());
                      Get.back();
                    },
                    child: Container(
                      height: 6.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: yl, borderRadius: BorderRadius.circular(1.h)),
                      child: Center(
                          child: alltext(
                              txt: "Save",
                              col: wh,
                              siz: 12.sp,
                              wei: FontWeight.bold,
                              max: 1)),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
