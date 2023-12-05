import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/screen/savedpost/savedpost.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

moredrawer(BuildContext context) async {
  List data = [
    "Settings and Privacy",
    "Saved",
    "Qr code",
    "oreder and payments",
    "verify"
  ];
  List<IconData> icons = [
    Icons.settings,
    Icons.bookmark_outline_sharp,
    Icons.qr_code,
    Icons.shop,
    Icons.verified
  ];
  return showBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 50.h,
          width: 100.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    1.h,
                  ),
                  topRight: Radius.circular(1.h)),
              color: bl.withOpacity(0.9)),
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 1.h,
                width: 10.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.h), color: wh),
              ),
              SizedBox(
                height: 2.h,
              ),
              const Divider(),
              SizedBox(
                height: 40.h,
                width: 100.w,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          if (index == 1) {
                          Get.to(() => savedpost_screen());
                          }
                        },
                        title: alltext(
                            txt: data[index],
                            col: wh,
                            siz: 10.sp,
                            wei: FontWeight.w400,
                            max: 1),
                        leading: CircleAvatar(
                          backgroundColor: wh.withOpacity(0.3),
                          child: Icon(
                            icons[index],
                            color: wh,
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        );
      });
}
