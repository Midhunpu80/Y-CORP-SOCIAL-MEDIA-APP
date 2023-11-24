import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/main.dart';
import 'package:social_syn/view/screen/cateogeory/viewexpertsscreen.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/customtab_bar.dart';

List contain = [posts(blu),savesposts(),reviews()];

class pro_userprofilescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_horiz_rounded,
                color: bl,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 7.h,
                backgroundColor: pp,
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            alltext(
                txt: "Midhun pu ",
                col: bl,
                siz: 15.sp,
                wei: FontWeight.bold,
                max: 1),
            SizedBox(
              height: 1.h,
            ),
            alltext(
                txt: "i am pri ui ux designer with flutter the  ",
                col: bl,
                siz: 10.sp,
                wei: FontWeight.w400,
                max: 1),
            alltext(
                txt: "kozhikode 9061603159",
                col: bl,
                siz: 9.sp,
                wei: FontWeight.w500,
                max: 1),
            SizedBox(
              height: 3.h,
            ),
            Container(
              height: 4.h,
              width: 73.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(1.h),
                    topRight: Radius.circular(1.h),
                  ),
                  color: wh),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  newtextdata(txt: "10", siz: 9.sp),
                  newtextdata(txt: "11", siz: 9.sp),
                  newtextdata(txt: "12", siz: 9.sp),
                ],
              ),
            ),
            Container(
              height: 4.h,
              width: 73.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(1.h),
                    bottomRight: Radius.circular(1.h),
                  ),
                  color: wh),
              child: Padding(
                padding: EdgeInsets.only(left: 3.h),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      newtextdatas(txt: "Posts", siz: 12.sp, col: gy),
                      newtextdatas(txt: "Followers", siz: 12.sp, col: gy),
                      newtextdatas(txt: "Followings", siz: 12.sp, col: gy),
                    ]),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: alltext(
                        txt: "            Follow         ",
                        col: wh,
                        siz: 12.sp,
                        wei: FontWeight.bold,
                        max: 1),
                    style: ElevatedButton.styleFrom(backgroundColor: pp)),
                ElevatedButton(
                  onPressed: () {},
                  child: alltext(
                      txt: "          messege       ",
                      col: wh,
                      siz: 12.sp,
                      wei: FontWeight.bold,
                      max: 1),
                  style: ElevatedButton.styleFrom(backgroundColor: gy),
                )
              ],
            ),
            customtabbar(),
            Container(
              height: 50.h,
              width: 100.w,
            
              child: Obx(() => contain[procontroll.newindex.value]),
            )
          ],
        ),
      ),
    );
  }
}
