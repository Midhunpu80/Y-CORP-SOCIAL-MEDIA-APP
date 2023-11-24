import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

deleteandreport_question(BuildContext context, var index) {
  return showBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 30.h,
          width: 100.w,
          color: re.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                InkWell(
                  onTap: () {
                   
                    Get.back();
                    print("one");
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        alltext(
                            txt: "delete",
                            col: bl,
                            siz: 12.sp,
                            wei: FontWeight.bold,
                            max: 1),
                        CircleAvatar(
                          radius: 2.h,
                          child: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                InkWell(
                  onTap: () {
                    print("two");
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        alltext(
                            txt: "Report",
                            col: bl,
                            siz: 12.sp,
                            wei: FontWeight.bold,
                            max: 1),
                        CircleAvatar(
                          radius: 2.h,
                          child: Icon(Icons.report),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}
