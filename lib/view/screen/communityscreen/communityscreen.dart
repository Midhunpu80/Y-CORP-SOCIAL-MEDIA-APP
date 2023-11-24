import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/askquestion.dart';
import 'package:social_syn/view/widgets/header.dart';

class communityscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterTop,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 5.h),
        child: FloatingActionButton(
          onPressed: () {
            askquestionsheet(context);
          },
          child: alltext(
              txt: "Ask Q?", col: bl, siz: 12.sp, wei: FontWeight.bold, max: 1),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 4.h,
              width: 20.w,
            ),
            header(tit: "Community"),
            ///communitypost(),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
