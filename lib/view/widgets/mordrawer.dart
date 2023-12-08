import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/main.dart';
import 'package:social_syn/view/screen/savedpost/savedpost.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/signout.dart';

moredrawer(BuildContext context) async {
  List data = [
    "Settings and Privacy",
    "Saved",
    "Qr code",
    "oreder and payments",
    "verify",
    "Logout"
  ];
  List<IconData> icons = [
    Icons.settings,
    Icons.bookmark_outline_sharp,
    Icons.qr_code,
    Icons.shop,
    Icons.verified,
    Icons.logout
  ];
  return showBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 55.h,
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
                height: 45.h,
                width: 100.w,
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          if (index == 1) {
                            Get.to(() => savedpost_screen());
                          } else if (index == 5) {
                            print("logout");

                            freedialogs(
                                context: context,
                                function:
                                    auth_controll.logout(context: context),
                                tit: "Logout",
                                des: "Are you sure to Logout this account",
                                type: DialogType.info);
                          }
                        },
                        title: alltext(
                            txt: data[index],
                            col: index == 5 ? re : wh,
                            siz: index == 5 ? 12.sp : 10.sp,
                            wei: FontWeight.w400,
                            max: 1),
                        leading: CircleAvatar(
                          backgroundColor:
                              index == 5 ? re : wh.withOpacity(0.3),
                          child: Icon(
                            icons[index],
                            color: index == 5 ? wh : wh,
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
