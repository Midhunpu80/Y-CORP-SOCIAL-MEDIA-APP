import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/screen/prouser_profilescreen/pro_userprofilescreen.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

class savedpost_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bl,
      appBar: AppBar(
        toolbarHeight: 10.h,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: wh,
            )),
        backgroundColor: bl,
        title: alltext(
            txt: "Saved", col: wh, siz: 12.sp, wei: FontWeight.bold, max: 1),
      ),
      // ignore: prefer_const_constructors
      body: GridView.builder(
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 1.h, mainAxisSpacing: 1.h),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Container(
                height: 10.h,
                width: 50.w,
                color: yl,
              ),
            );
          }),
    );
  }
}
