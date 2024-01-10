
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/buttons.dart';
import 'package:social_syn/view/utility/colors.dart';

Widget header({required var tit,required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        height: 7.h,
        width: 100.w,

        /// color: Color.fromARGB(255, 101, 76, 175),
        child: Row(
          children: [
            alltext(
                txt: tit,
                col: bl,
                siz: 18.sp,
                wei: FontWeight.w600,
                max: 1),
            Spacer(),
            messegebutton(context),
            notificationbutton(),
          ],
        )),
  );
}
