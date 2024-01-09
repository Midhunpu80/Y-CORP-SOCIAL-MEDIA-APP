// ignore_for_file: use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:social_syn/main.dart';
import 'package:social_syn/view/screen/allusers/allusers.dart';
import 'package:social_syn/view/screen/createpost/createpost_screen.dart';
import 'package:social_syn/view/screen/explorescreen.dart/explorescreen.dart';
import 'package:social_syn/view/screen/home/homescreen.dart';
import 'package:social_syn/view/screen/profilescreen.dart/profilescreen.dart';
import 'package:social_syn/view/utility/colors.dart';

class bottomnavscreen extends StatelessWidget {
  dynamic one;
  List pages = [
    homescreen(),
    const explorescreem(),
    const create_postscreen(),
    allusers_screen(),
    const profilescreen()
  ];

  ///bottomct.index.value,

  /// bottomct.changeindex(index);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: wh,
              onTap: (value) {
                bottomct.changeindex(value);
              },
              backgroundColor: yl,
              currentIndex: bottomct.index.value,
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.home_outlined,
                    ),
                    label: "Home",
                    backgroundColor: bl),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.explore),
                    label: "Explore",
                    backgroundColor: bl),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.add_circle_outline_outlined),
                    label: "Post",
                    backgroundColor: bl),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.group_add_outlined),
                    label: "Friends",
                    backgroundColor: bl),
                BottomNavigationBarItem(
                    icon: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('Users')
                            .where('uid',
                                isEqualTo:
                                    FirebaseAuth.instance.currentUser?.uid)
                            .snapshots(),
                        builder: (context, snapshot) {
                          final snap = snapshot.data?.docs[0];
                          return !snapshot.hasData
                              ? const Center(child: CircularProgressIndicator())
                              : CircleAvatar(
                                backgroundImage:
                                     NetworkImage(snap?['profile']),
                                );
                        }),
                    label: "Profile",
                    backgroundColor: bl),
              ]),

          /// ]),
          body: pages[bottomct.index.value],
        ));
  }
}

// StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('Users')
//             .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//             .snapshots(),
//         builder: (context, snapshot) {
//           final snap = snapshot.data!.docs[0];
//           return