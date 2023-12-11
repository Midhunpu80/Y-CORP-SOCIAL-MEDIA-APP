import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/screen/settings/screens/privacypolicyscreen.dart';
import 'package:social_syn/view/screen/settings/screens/termsandcontions.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

// ignore: camel_case_types
class settingsscreen extends StatelessWidget {
  List<IconData> icos = [
    Icons.privacy_tip,
    Icons.lock,
    Icons.not_listed_location_sharp
  ];
  List icosnames = ["privacy and policy", "termas and conditions", "Abouts"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bl,
      appBar: AppBar(
        toolbarHeight: 10.h,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: wh,
            )),
        backgroundColor: bl,
        title: alltext(
            txt: "settings and privacy",
            col: wh,
            siz: 13.sp,
            wei: FontWeight.bold,
            max: 1),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                if (index == 0) {
                  Get.to(() => privacypolicyscreen());
                }
                if (index == 1) {
                  Get.to(() => termasandconditionscreen());
                }
              },
              leading: Icon(
                icos[index],
                color: wh,
              ),
              title: alltext(
                  txt: icosnames[index],
                  col: wh,
                  siz: 12.sp,
                  wei: FontWeight.bold,
                  max: 1),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox();
          },
          itemCount: icosnames.length),
    );
  }
}
