// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/header.dart';

class view_experts_screen extends StatelessWidget {
  const view_experts_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(backgroundColor: re),
        body: Column(
      children: [
        SizedBox(
          height: 4.h,
        ),
        header(tit: "contactors"),
        Container(
          height: 85.h,
          width: 100.w,
          child: GridView.builder(
              itemCount: 8,
              // ignore: prefer_const_constructors
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.8),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => const view_experts_screen());
                    },
                    child: Container(
                      height: 10.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.h),
                        color: or,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          CircleAvatar(
                            radius: 4.h,
                            backgroundColor: bl.withOpacity(0.3),
                          ),
                          alltext(
                              txt: "Midhun pu",
                              col: bl,
                              siz: 10.sp,
                              wei: FontWeight.bold,
                              max: 1),
                          alltext(
                              txt: "Contractor",
                              col: bl,
                              siz: 10.sp,
                              wei: FontWeight.w400,
                              max: 1),
                          alltext(
                              txt: "Thrissur",
                              col: bl,
                              siz: 10.sp,
                              wei: FontWeight.w400,
                              max: 1),
                          alltext(
                              txt: "9061603159",
                              col: bl,
                              siz: 8.sp,
                              wei: FontWeight.bold,
                              max: 1),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            height: 4.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(1.h),
                                  topRight: Radius.circular(1.h),
                                ),
                                color: wh),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                newtextdata(txt: "1", siz: 8.sp),
                                newtextdata(txt: "1", siz: 8.sp),
                                newtextdata(txt: "1", siz: 8.sp),
                                newtextdata(txt: "1", siz: 8.sp)
                              ],
                            ),
                          ),
                          Container(
                            height: 4.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(1.h),
                                  bottomRight: Radius.circular(1.h),
                                ),
                                color: wh),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                newtextdatas(txt: "posts", siz: 7.sp,col: bl),
                                newtextdatas(txt: "followers", siz:  7.sp,col: bl),
                                newtextdatas(txt: "reviews", siz:  7.sp,col: bl),
                                newtextdatas(txt: "Hire", siz:  7.sp,col: bl)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    ));
  }
}

newtextdata({required var txt,required double siz}) {
  return alltext(txt: txt, col: bl, siz: siz, wei: FontWeight.bold, max: 1);
}

newtextdatas({required var txt,required double siz, required Color col}) {
  return alltext(txt: txt, col: col, siz: siz, wei: FontWeight.bold, max: 1);
}

