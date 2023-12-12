// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/view/screen/messegescreen/groupscreen.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/buttons.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/usersList.dart';

class messegeScreen extends StatelessWidget {
  const messegeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: bl,
          appBar: AppBar(
            toolbarHeight: 7.h,
            bottom: TabBar(
                labelColor: wh,
                indicatorColor: wh,
                labelStyle: TextStyle(
                    color: bl, fontSize: 9.sp, fontWeight: FontWeight.bold),
                unselectedLabelColor: wh,
                tabs: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Tab(
                      text: "Generel",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Tab(
                      text: "Groups",
                    ),
                  ),
                ]),
            actions: [notificationbutton(), settingsbutton()],
            title: alltext(
                txt: "friends",
                col: wh,
                siz: 13.sp,
                wei: FontWeight.w400,
                max: 1),
            backgroundColor: bl,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: wh,
                )),
          ),
          body: TabBarView(children: [
            generalscreen(),
            groupscreen(),
          ])),
    );
  }
}

class generalscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          txt: "Messeges",
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
            allusersList(),
          ],
        ),
      ),
    );
  }
}
