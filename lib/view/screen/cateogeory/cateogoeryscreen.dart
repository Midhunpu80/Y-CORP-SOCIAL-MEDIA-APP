import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/view/screen/cateogeory/viewexpertsscreen.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/header.dart';

class cateogeoryscreen extends StatelessWidget {
  const cateogeoryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 4.h,
          ),
          header(tit: "Cateogery"),
          Container(
            height: 76.h,
            width: 100.w,
            decoration: BoxDecoration(
                color: wh,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(3.h),
                    topRight: Radius.circular(3.h))),
            child: GridView.builder(
                itemCount: 8,
                // ignore: prefer_const_constructors
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => view_experts_screen());
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
                                txt: "tech data",
                                col: bl,
                                siz: 10.sp,
                                wei: FontWeight.bold,
                                max: 1)
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
