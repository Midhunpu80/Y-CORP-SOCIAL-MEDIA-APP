// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/main.dart';
import 'package:social_syn/view/screen/cateogeory/cateogoeryscreen.dart';
import 'package:social_syn/view/screen/communityscreen/communityscreen.dart';
import 'package:social_syn/view/screen/home/homescreen.dart';
import 'package:social_syn/view/screen/profilescreen.dart/profilescreen.dart';
import 'package:social_syn/view/utility/colors.dart';

class bottomnavscreen extends StatelessWidget {
  dynamic one;
  List pages = [
    homescreen(),
    communityscreen(),
    cateogeoryscreen(),
    profilescreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: wh,
          drawerScrimColor: blu,
          bottomNavigationBar: GNav(
              gap: 8,
              curve: Curves.bounceInOut,
              tabMargin: EdgeInsets.all(5),
              tabBackgroundColor: wh.withOpacity(0.3),
              onTabChange: (value) {
                bottomct.changeindex(value);

                ///   question_controll.getquesions();
                // getposts_controll.getposts_services();
              },
              tabBorderRadius: 12,
              color: wh,
              selectedIndex: bottomct.index.value,
              backgroundColor: bl,
              iconSize: 3.h,
              tabs: const [
                GButton(icon: Icons.home),
                GButton(icon: Icons.people_outline_rounded),
                GButton(icon: Icons.category_rounded),
                GButton(icon: Icons.person_2_outlined),
              ]),
          body: pages[bottomct.index.value],
        ));
  }
}
