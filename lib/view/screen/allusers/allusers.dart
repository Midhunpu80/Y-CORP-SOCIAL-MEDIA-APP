import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/buttons.dart';
import 'package:social_syn/view/utility/colors.dart';

class allusers_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bl,
      appBar: AppBar(
        actions: [
          messegebutton(),
          notificationbutton(),
        ],
        toolbarHeight: 10.h,
        leading: Icon(
          Icons.group,
          color: wh,
        ),
        backgroundColor: bl,
        title: alltext(
            txt: "All users",
            col: wh,
            siz: 13.sp,
            wei: FontWeight.bold,
            max: 1),
      ),
      body: Container(
        height: 100.h,
        width: 100.w,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                height: 10.h,
                width: 100.w,
                child: ListTile(
                  trailing: Container(
                    height: 4.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                        color: blu, borderRadius: BorderRadius.circular(1.h)),
                    child: Center(
                      child: alltext(
                          txt: "FOLLOW",
                          col: wh,
                          siz: 7.sp,
                          wei: FontWeight.bold,
                          max: 1),
                    ),
                  ),
                  subtitle: alltext(
                      txt: "Midhuns",
                      col: wh.withOpacity(0.5),
                      siz: 8.sp,
                      wei: FontWeight.bold,
                      max: 1),
                  leading: CircleAvatar(
                    radius: 3.h,
                  ),
                  title: alltext(
                      txt: "All users",
                      col: wh,
                      siz: 11.sp,
                      wei: FontWeight.bold,
                      max: 1),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox();
            },
            itemCount: 10),
      ),
    );
  }
}
