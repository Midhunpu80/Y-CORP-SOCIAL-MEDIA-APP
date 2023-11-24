import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

List<IconData> nes = [
  Icons.ac_unit_rounded,
  Icons.access_alarms,
  Icons.abc_outlined
];

Widget customtabbar() {
  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(
          height: 2.h,
        ),
        SizedBox(
          height: 14.h,
          width: 100.w,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {

                          print("now id one ");
                        },
                        icon: Icon(
                          Icons.grid_4x4_rounded,
                          size: 3.h,
                        )),
                    IconButton(
                        onPressed: () {
                          print("now is teo");
                        },
                        icon: Icon(
                          Icons.save_outlined,
                          size: 3.h,
                        )),
                    IconButton(
                        onPressed: () {
                          print("now is theee");
                        },
                        icon: Icon(
                          Icons.reviews,
                          size: 3.h,
                        ))
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      alltext(
                          txt: "posts",
                          col: bl,
                          siz: 11.sp,
                          wei: FontWeight.bold,
                          max: 1),
                      alltext(
                          txt: "saved",
                          col: bl,
                          siz: 11.sp,
                          wei: FontWeight.bold,
                          max: 1),
                      alltext(
                          txt: "Reviews",
                          col: bl,
                          siz: 11.sp,
                          wei: FontWeight.bold,
                          max: 1),
                    ],
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget posts(Color col) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 40.h,
      width: 100.w,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 5, crossAxisSpacing: 5),
          itemBuilder: (context, index) {
            return Container(
              height: 40.h,
              width: 100.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1.h), color: col),
            );
          }),
    ),
  );
}

Widget savesposts() {
  return posts(re);
}

Widget reviews() {
  return Container(
    height: 40.h,
    width: 100.w,
    color: yl,
  );
}
