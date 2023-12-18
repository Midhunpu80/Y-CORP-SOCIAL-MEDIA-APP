import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/main.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

creategroups(
    {required BuildContext context,
    required TextEditingController controller}) {
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
          backgroundColor: gy.withOpacity(0.3),
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
                  Obx(
                    () => usercont.img.value == null
                        ? CircleAvatar(
                            radius: 6.h,
                            backgroundColor: gy,
                          )
                        : CircleAvatar(
                            backgroundImage: MemoryImage(usercont.img.value!),
                            radius: 6.h,
                            backgroundColor: gy,
                          ),
                  ),
                  TextButton(
                      onPressed: () {
                        usercont.pick();
                      },
                      child: alltext(
                          txt: "Add Group icon",
                          col: blu,
                          siz: 11.sp,
                          wei: FontWeight.bold,
                          max: 1)),
                  TextFormField(
                    controller: gpcontroller,
                    style: TextStyle(color: wh),
                    decoration: InputDecoration(
                        hintText: "Enter the group name",
                        hintStyle: TextStyle(color: wh),
                        prefixIcon: Icon(
                          Icons.person_2,
                          color: wh,
                        ),
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  InkWell(
                    onTap: () async {
                      gcontroll.creategroup(
                          gname: gpcontroller.text.toString(),
                          file: usercont.img.value);
                      Get.back();

                    },
                    child: Container(
                        height: 6.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.h),
                            color: yl),
                        child: Center(
                          child: alltext(
                              txt: "Create",
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
