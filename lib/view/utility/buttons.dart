import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/view/screen/messegescreen/messegescreen.dart';
import 'package:social_syn/view/screen/notificationscreen/notificationscreen.dart';
import 'package:social_syn/view/screen/prouser_profilescreen/pro_userprofilescreen.dart';
import 'package:social_syn/view/screen/searchscreen/searchscreen.dart';
import 'package:social_syn/view/utility/colors.dart';

Widget messegebutton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: CircleAvatar(
      radius: 3.h,
      backgroundColor: wh.withOpacity(0.2),
      child: IconButton(
          onPressed: () {
            Get.to(() => messegeScreen());

            ///  customsnackbar(context);
          },
          icon: Icon(
            Icons.message,
            color: wh,
            size: 2.h,
          )),
    ),
  );
}

Widget notificationbutton() {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: CircleAvatar(
      radius: 3.h,
      backgroundColor: wh.withOpacity(0.2),
      child: IconButton(
          onPressed: () {
            Get.to(() => notificationscreen());
          },
          icon: Icon(
            Icons.favorite,
            color: wh,
            size: 2.h,
          )),
    ),
  );
}

Widget settingsbutton() {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: CircleAvatar(
      radius: 2.h,
      backgroundColor: wh.withOpacity(0.2),
      child: IconButton(
          onPressed: () {
            Get.to(() => pro_userprofilescreen());
          },
          icon: Icon(
            Icons.settings,
            color: wh,
            size: 2.h,
          )),
    ),
  );
}

Widget searchbutton() {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: CircleAvatar(
      radius: 3.h,
      backgroundColor: wh.withOpacity(0.2),
      child: IconButton(
          onPressed: () {
            Get.to(() => searchscreen());
          },
          icon: Icon(
            Icons.search,
            color: wh,
            size: 2.h,
          )),
    ),
  );
}
