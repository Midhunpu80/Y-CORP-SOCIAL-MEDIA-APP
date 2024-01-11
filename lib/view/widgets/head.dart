import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/buttons.dart';
import 'package:social_syn/view/utility/colors.dart';

Widget drawwer(BuildContext context) {
  return SliverAppBar(
      backgroundColor: bl,
      leading: const Icon(
        Icons.abc,
        color: Colors.transparent,
      ),
      toolbarHeight: 8.h,
      flexibleSpace: Padding(
        padding: EdgeInsets.only(top: 4.h),
        child: Container(
          height: 8.h,
          width: 100.w,
          color: bl,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: wh.withOpacity(0.3),
                  backgroundImage:
                      const AssetImage('images/y-high-resolution-logo.png'),
                ),
                SizedBox(
                  width: 2.h,
                ),
                alltext(
                    txt: "Corp",
                    col: wh,
                    siz: 17.sp,
                    wei: FontWeight.bold,
                    max: 1),
                // CircleAvatar(
                //   backgroundColor: bl,
                //   radius: 3.h,
                // ),
                const Spacer(),
                searchbutton(),
                messegebutton(context),
                notificationbutton(),
              ],
            ),
          ),
        ),
      ));
}
