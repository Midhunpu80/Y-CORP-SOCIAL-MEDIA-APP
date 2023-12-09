import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/griduserposts.dart';
import 'package:social_syn/view/widgets/mordrawer.dart';
import 'package:social_syn/view/widgets/profilecard.dart';

class profilescreen extends StatelessWidget {
  const profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Posts')
            .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshots) {
          return Scaffold(
              backgroundColor: bl,
              body: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Users')
                      .where('uid',
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    final snap = snapshot.data?.docs[0];

                    ///  Map<String,dynamic>?  snap = snapshot.data?.data();
                    ///  Timestamp timestamp = snap!["date"];

                    return snapshot.hasData
                        ? StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('Users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .collection('following')
                                .snapshots(),
                            builder: (context, snaped) {
                              final following =
                                  snaped.data?.docs.length.toString();
                              return !snaped.hasData
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : StreamBuilder(
                                      stream: FirebaseFirestore.instance
                                          .collection('Users')
                                          .doc(FirebaseAuth
                                              .instance.currentUser!.uid)
                                          .collection('followers')
                                          .snapshots(),
                                      builder: (context, snapshoted) {
                                        final followers =
                                            snapshoted.data?.docs.length;
                                        return CustomScrollView(
                                          slivers: [
                                            SliverAppBar(
                                              toolbarHeight: 9.h,
                                              backgroundColor: bl,
                                              leading: const Icon(
                                                Icons.analytics,
                                                color: Colors.transparent,
                                              ),
                                              flexibleSpace: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 3.h),
                                                      child: SizedBox(
                                                          child: alltext(
                                                              txt:
                                                                  snap!["name"],
                                                              col: wh,
                                                              siz: 14.sp,
                                                              wei: FontWeight
                                                                  .bold,
                                                              max: 1)),
                                                    ),
                                                    Spacer(),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 3.h),
                                                      child: IconButton(
                                                          onPressed: () {},
                                                          icon: Icon(
                                                            Icons.add,
                                                            color: wh,
                                                          )),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 3.h),
                                                      child: IconButton(
                                                          onPressed: () {
                                                            moredrawer(context);
                                                          },
                                                          icon: Icon(
                                                            Icons.menu,
                                                            color: wh,
                                                          )),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            profilecard(
                                                profileimg: snap['profile'],
                                                name: snap['name'],
                                                followrs: followers.toString(),
                                                folllowing:
                                                    following.toString(),
                                                phone: snap['phone'],
                                                gender: snap['gender'],
                                                id: snap.id,
                                                bio: snap['bio'],
                                                lastname: snap['last name'], snapsss: null, snapid: null),
                                            usergrid_post(
                                                itemcount:
                                                    snapshots.data!.docs.length,
                                                snaps: snapshots.data!.docs),
                                          ],
                                        );
                                      });
                            })
                        : Center(child: CircularProgressIndicator());
                  }));
        });
  }
}
