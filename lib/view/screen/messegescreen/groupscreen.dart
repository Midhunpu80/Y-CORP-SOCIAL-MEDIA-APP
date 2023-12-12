import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

class groupscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: yl,
          child: Icon(
            Icons.add,
            color: bl,
          ),
          onPressed: () {}),
      backgroundColor: bl,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 2.h, top: 4.h),
                  child: SizedBox(
                      child: alltext(
                          txt: "Groups",
                          col: wh,
                          siz: 12.sp,
                          wei: FontWeight.bold,
                          max: 1)),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 2.h, top: 3.h),
                  child: Icon(
                    Icons.do_not_disturb_on_total_silence_sharp,
                    color: wh,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
