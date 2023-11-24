import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/buttons.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/usersList.dart';

class messegeScreen extends StatelessWidget {
  const messegeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
         notificationbutton(),settingsbutton()
        ],
        title: alltext(
            txt: "Contacts", col: bl, siz: 13.sp, wei: FontWeight.w400, max: 1),
        backgroundColor: wh,
      ),
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
                          txt: "Messeges",
                          col: bl,
                          siz: 12.sp,
                          wei: FontWeight.bold,
                          max: 1)),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 2.h, top: 3.h),
                  child: const Icon(Icons.do_not_disturb_on_total_silence_sharp),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            allusersList(),
          ],
        ),
      ),
    );
  }
}
