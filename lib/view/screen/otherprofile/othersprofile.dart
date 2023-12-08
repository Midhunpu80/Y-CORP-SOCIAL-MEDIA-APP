import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/griduserposts.dart';
import 'package:social_syn/view/widgets/profilecard.dart';

class othersprofile_screen extends StatelessWidget {
  othersprofile_screen({required this.id});
  String id;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Posts')
            .where('uid', isEqualTo: id.toString())
            .snapshots(),
        builder: (context, snapshots) {
          /// final snapss = s.data!.docs;
          return !snapshots.hasData
              ? Center(child: CircularProgressIndicator())
              : Scaffold(
                  backgroundColor: bl,
                  body: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('Users')
                          .where('uid', isEqualTo: id.toString())
                          .snapshots(),
                      builder: (context, snapshot) {
                        final snap = snapshot.data!.docs[0];

                        return CustomScrollView(
                          slivers: [
                            SliverAppBar(
                              title: alltext(
                                  txt: snap['name'],
                                  col: wh,
                                  siz: 11.sp,
                                  wei: FontWeight.bold,
                                  max: 1),
                              backgroundColor: bl,
                              toolbarHeight: 5.h,
                              leading: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: wh,
                                  )),
                            ),
                            profilecard(
                                name: snap['name'],
                                folllowing: snap['following'].toString().length,
                                followrs: snap['followers'].toString().length,
                                phone: snap['phone'].toString().length,
                                id: snap['uid'].toString().length,
                                gender: snap['gender'].toString(),
                                bio: snap['bio'].toString(),
                                lastname: snap['last name'].toString(),
                                profileimg: snap['profile'].toString()),
                            usergrid_post(
                                itemcount: snapshots.data!.docs.length,
                                snaps: snapshots.data!.docs),
                          ],
                        );
                      }),
                );
        });
  }
}
