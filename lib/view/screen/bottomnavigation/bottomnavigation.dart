// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:social_syn/main.dart';
import 'package:social_syn/view/screen/allusers/allusers.dart';
import 'package:social_syn/view/screen/cateogeory/cateogoeryscreen.dart';
import 'package:social_syn/view/screen/createpost/createpost_screen.dart';
import 'package:social_syn/view/screen/explorescreen.dart/explorescreen.dart';
import 'package:social_syn/view/screen/home/homescreen.dart';
import 'package:social_syn/view/screen/profilescreen.dart/profilescreen.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:sweet_nav_bar/sweet_nav_bar.dart';

class bottomnavscreen extends StatelessWidget {
  dynamic one;
  List pages = [
    homescreen(),
    const explorescreem(),
    const create_postscreen(),
  allusers_screen(),
    const profilescreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: wh,
          drawerScrimColor: blu,
          bottomNavigationBar: SweetNavBar(
            backgroundColor: gy.withOpacity(0.3),
            //paddingGradientColor: iconLinearGradiant,
            currentIndex: bottomct.index.value,
            paddingBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
            items: [
              SweetNavBarItem(
                  sweetActive: const Icon(Icons.home),
                  sweetIcon: const Icon(
                    Icons.home_outlined,
                  ),
                  sweetLabel: 'Home',
                  // iconColors: blu,
                  sweetBackground: wh.withOpacity(0.8)),
              SweetNavBarItem(
                  sweetIcon: const Icon(Icons.explore_outlined),
                  sweetLabel: 'Business'),
              SweetNavBarItem(
                  sweetIcon: const Icon(Icons.add_circle_outline_rounded),
                  sweetLabel: 'createpost'),
              SweetNavBarItem(
                  sweetIcon: const Icon(Icons.school), sweetLabel: 'School'),
              SweetNavBarItem(
                  sweetIcon: const Icon(Icons.person), sweetLabel: 'School'),
            ],
            onTap: (index) {
              bottomct.changeindex(index);
            },
          ),
          body: pages[bottomct.index.value],
        ));
  }
}
