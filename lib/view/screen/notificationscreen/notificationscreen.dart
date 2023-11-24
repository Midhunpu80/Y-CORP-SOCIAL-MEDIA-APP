import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

class notificationscreen extends StatelessWidget {
  const notificationscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wh.withOpacity(0.3),
      appBar: AppBar(
        title: alltext(
            txt: "Notifications",
            col: bl,
            siz: 12.sp,
            wei: FontWeight.w500,
            max: 1),
        backgroundColor: re,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 89.h,
              width: 100.w,
              color: wh.withOpacity(0.8),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 14.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.h),
                            color: wh),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 2.h, top: 1.h, right: 2.h),
                                  child: CircleAvatar(
                                    radius: 3.h,
                                    backgroundColor: re,
                                  ),
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Row(
                                      children: [
                                        alltext(
                                            txt: "midhun pu",
                                            col: bl,
                                            siz: 12.sp,
                                            wei: FontWeight.bold,
                                            max: 1),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        alltext(
                                            txt: "Reacted to your Recuirement",
                                            col: bl,
                                            siz: 10.sp,
                                            wei: FontWeight.w400,
                                            max: 1)
                                      ],
                                    ),
                                    alltext(
                                        txt:
                                            "Interested to your requirement Click to hire",
                                        col: bl,
                                        siz: 9.sp,
                                        wei: FontWeight.w400,
                                        max: 1),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    alltext(
                                        txt:
                                            "23 hours ago                                                ",
                                        col: blu,
                                        siz: 9.sp,
                                        wei: FontWeight.w400,
                                        max: 1),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox();
                  },
                  itemCount: 55),
            )
          ],
        ),
      ),
    );
  }
}
