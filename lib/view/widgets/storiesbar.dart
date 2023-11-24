import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/main.dart';
import 'package:social_syn/view/screen/requirementscreen/reuirementscreen.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

List reqdata = ["requirement", "createReq", "Hope", "Sa", "Rock"];
Widget storiesbar() {
  return SliverAppBar(
    backgroundColor: bl,
    toolbarHeight: 15.h,
    flexibleSpace: Container(
        height: 14.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Obx(
          () => procontroll.gropdata.value == 2
              ? Container(
                  height: 10.h,
                  width: 100.w,
                  color: gr,
                )
              : ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                if (index == 0) {
                                  Get.to(() => reuirementscreen());
                                }
                              },
                              child: Container(
                                height: 9.h,
                                width: 19.w,
                                decoration: BoxDecoration(
                                    color: gr,
                                    borderRadius: BorderRadius.circular(10.h),
                                    border: Border.all(width: 1, color: bl)),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            SizedBox(
                              child: alltext(
                                  txt: reqdata[index],
                                  col: wh,
                                  siz: 8.sp,
                                  wei: FontWeight.bold,
                                  max: 1),
                            )
                          ],
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox();
                  },
                  itemCount: 5),
        )),
  );
}
