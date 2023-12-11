import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/griduserposts.dart';
import 'package:social_syn/view/widgets/profilecard.dart';

// ignore: must_be_immutable
class othersprofile_screen extends StatelessWidget {
  othersprofile_screen(
      {super.key, required this.id,
      required this.followingsnap,
      required this.thischange});
  String id;
  dynamic followingsnap;
  bool thischange;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Posts')
            .where('uid', isEqualTo: id.toString())
            .snapshots(),
        builder: (context, snapshots) {
          final totalposts = snapshots.data?.docs.length;
          return !snapshots.hasData
              ? const Center(child: CircularProgressIndicator())
              : Scaffold(
                  backgroundColor: bl,
                  body: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('Users')
                          .where('uid', isEqualTo: id.toString())
                          .snapshots(),
                      builder: (context, snapshot) {
                        final snap = snapshot.data?.docs[0];

                        return StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('Users')
                                .doc(FirebaseAuth.instance.currentUser?.uid)
                                .collection('following')
                                .snapshots(),
                            builder: (context, snapshoted) {
                              final following = snapshoted.data!.docs.length;
                              return StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection('Users')
                                      .doc(id)
                                      .collection('followers')
                                      .snapshots(),
                                  builder: (context, snapshost) {
                                    final followers =
                                        snapshost.data?.docs.length;

                                    return CustomScrollView(
                                      slivers: [
                                        SliverAppBar(
                                          title: alltext(
                                              txt: snap?['name'],
                                              col: wh,
                                              siz: 11.sp,
                                              wei: FontWeight.bold,
                                              max: 1),
                                          backgroundColor: bl,
                                          toolbarHeight: 5.h,
                                          leading: IconButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              icon: Icon(
                                                Icons.arrow_back,
                                                color: wh,
                                              )),
                                        ),
                                        profilecard(
                                            name: snap!['name'],
                                            folllowing: following.toString(),
                                            followrs: followers.toString(),
                                            phone:
                                                snap['phone'].toString().length,
                                            id: snap['uid'].toString().length,
                                            gender: snap['gender'].toString(),
                                            bio: snap['bio'].toString(),
                                            lastname:
                                                snap['last name'].toString(),
                                            profileimg:
                                                snap['profile'].toString(),
                                            snapsss: snapshoted.data?.docs,
                                            snapid: snap.id,
                                            thischange: thischange,
                                            totoalposts: totalposts),
                                        usergrid_post(
                                            itemcount:
                                                snapshots.data!.docs.length,
                                            snaps: snapshots.data!.docs,
                                            thischange: thischange),
                                      ],
                                    );
                                  });
                            });
                      }),
                );
        });
  }
}
