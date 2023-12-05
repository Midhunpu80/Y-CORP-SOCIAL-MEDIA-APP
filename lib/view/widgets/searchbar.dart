import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/screen/searchscreen/searchscreen.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

searchbar() {
  return SliverAppBar(
    toolbarHeight: 7.h,
    backgroundColor: bl,
    flexibleSpace: Padding(
      padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 2.h),
      child: InkWell(
        onTap: () {
          Get.to(() => searchscreen());
        },
        child: Container(
          height: 7.h,
          width: 80.w,
          decoration: BoxDecoration(
              border: Border.all(width: 0, color: wh),
              borderRadius: BorderRadius.circular(1.h)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search_sharp,
                  color: wh,
                ),
              ),
              SizedBox(
                width: 1.h,
              ),
              alltext(
                  txt: "Search",
                  col: wh,
                  siz: 11.sp,
                  wei: FontWeight.w500,
                  max: 1),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.category,
                  color: wh,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
