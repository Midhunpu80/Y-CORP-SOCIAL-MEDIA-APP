import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/buttons.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/likeandcommentbar.dart';

Widget drawwer() {
  return SliverAppBar(
      toolbarHeight: 8.h,
      flexibleSpace: SafeArea(
        child: Container(
          height: 8.h,
          width: 100.w,
          color: bl,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                alltext(
                    txt: "Social sync",
                    col: wh,
                    siz: 17.sp,
                    wei: FontWeight.bold,
                    max: 1),
                // CircleAvatar(
                //   backgroundColor: bl,
                //   radius: 3.h,
                // ),
                const Spacer(),
                messegebutton(),
                notificationbutton(),
              ],
            ),
          ),
        ),
      ));
}
