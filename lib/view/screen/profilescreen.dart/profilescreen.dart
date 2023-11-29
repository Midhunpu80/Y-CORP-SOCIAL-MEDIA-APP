import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/griduserposts.dart';
import 'package:social_syn/view/widgets/profilecard.dart';

class profilescreen extends StatelessWidget {
  const profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bl,
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Users')
                .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              final snap = snapshot.data?.docs[0];


              ///  Map<String,dynamic>?  snap = snapshot.data?.data();

              return snapshot.hasData
                  ? CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          toolbarHeight: 9.h,
                          backgroundColor: bl,
                          leading: const Icon(
                            Icons.analytics,
                            color: Colors.transparent,
                          ),
                          flexibleSpace: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 3.h),
                                  child: SizedBox(
                                      child: alltext(
                                          txt: snap!["name"],
                                          col: wh,
                                          siz: 12.sp,
                                          wei: FontWeight.bold,
                                          max: 1)),
                                ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(top: 3.h),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add,
                                        color: wh,
                                      )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 3.h),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.cases,
                                        color: wh,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                        profilecard(name: snap['name'], followrs: null, folllowing: null),
                        usergrid_post(),
                      ],
                    )
                  : CircularProgressIndicator();
            }));
  }
}
