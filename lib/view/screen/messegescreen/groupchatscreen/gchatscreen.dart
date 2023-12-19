import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/view/screen/messegescreen/groupchatscreen/groupdetails.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

class groupchat_screen extends StatelessWidget {
  List cant = [];
  // ignore: use_key_in_widget_constructors
  groupchat_screen(
      {required this.id, required this.name, required this.profile});
  String name;
  String id;
  String profile;
  final chatcontroll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bl,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.call,
              color: wh,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.video_call_rounded,
              color: wh,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.more_vert_outlined,
              color: wh,
            ),
          )
        ],
        toolbarHeight: 10.h,
        leading: FittedBox(
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                    print(id.toString());
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: wh,
                    size: 15.h,
                  )),
              SizedBox(
                width: 15.w,
              ),
              CircleAvatar(
                radius: 8.h,
                backgroundImage: NetworkImage(profile.toString()),
              )
            ],
          ),
        ),
        backgroundColor: bl,
        title: InkWell(
          onTap: () {
            Get.to(() => groupdetailsscreen(
              name: name,
              profile: profile,
                  gid: id,
                ));
          },
          child: SizedBox(
              child: alltext(
                  txt: name,
                  col: wh,
                  siz: 11.sp,
                  wei: FontWeight.w400,
                  max: 1)),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('Groups')
              .doc(id)
              .collection(
                "members",
              )
              .orderBy('time')
              .snapshots(),
          builder: (context, msnapshot) {
            return !msnapshot.hasData
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('Users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .collection('Groups')
                                .doc(id)
                                .collection(
                                  "messege",
                                )
                                .orderBy('time')
                                .snapshots(),
                            builder: (context, snapshot) {
                              return !snapshot.hasData
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Container(
                                      height: 78.h,
                                      width: 100.w,
                                      child: ListView.separated(
                                          itemBuilder: (context, index) {
                                            final snaps =
                                                snapshot.data!.docs[index];
                                            Timestamp timestamp = snaps["time"];
                                            DateTime dateTime =
                                                timestamp.toDate();

                                            // ignore: unused_local_variable
                                            String fomttime =
                                                DateFormat('hh:mm a')
                                                    .format(dateTime);
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: snaps['name'].toString() !=
                                                      name
                                                  ? Column(
                                                      children: [
                                                        Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 39.h),
                                                            child: alltext(
                                                                txt: snaps[
                                                                    'name'],
                                                                col: wh,
                                                                siz: 7.sp,
                                                                wei: FontWeight
                                                                    .bold,
                                                                max: null)),
                                                        Container(
                                                          width: 100.w,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 30.h),
                                                          decoration: BoxDecoration(
                                                              color: blu
                                                                  .withOpacity(
                                                                      0.8),
                                                              borderRadius: BorderRadius.only(
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          3.h),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          3.h))),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(13.0),
                                                            child: SizedBox(
                                                                child: alltext(
                                                                    txt: snaps[
                                                                        'text'],
                                                                    col: wh,
                                                                    siz: 10.sp,
                                                                    wei: FontWeight
                                                                        .bold,
                                                                    max: null)),
                                                          ),
                                                        ),
                                                        Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 39.h),
                                                            child: alltext(
                                                                txt: fomttime
                                                                    .toString(),
                                                                col: wh,
                                                                siz: 7.sp,
                                                                wei: FontWeight
                                                                    .bold,
                                                                max: null)),
                                                      ],
                                                    )
                                                  : Column(
                                                      children: [
                                                        Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        37.h),
                                                            child: alltext(
                                                                txt: snaps[
                                                                    'name'],
                                                                col: wh,
                                                                siz: 7.sp,
                                                                wei: FontWeight
                                                                    .bold,
                                                                max: null)),
                                                        Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        30.h),
                                                            width: 100.w,
                                                            decoration: BoxDecoration(
                                                                color: gy
                                                                    .withOpacity(
                                                                        0.3),
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius
                                                                        .circular(3
                                                                            .h),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            3.h))),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      13.0),
                                                              child: SizedBox(
                                                                  child: alltext(
                                                                      txt: snaps[
                                                                          'text'],
                                                                      col: wh,
                                                                      siz:
                                                                          10.sp,
                                                                      wei: FontWeight
                                                                          .bold,
                                                                      max:
                                                                          null)),
                                                            )),
                                                        Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right:
                                                                        37.h),
                                                            child: alltext(
                                                                txt: fomttime
                                                                    .toString(),
                                                                col: wh,
                                                                siz: 7.sp,
                                                                wei: FontWeight
                                                                    .bold,
                                                                max: null)),
                                                      ],
                                                    ),
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return SizedBox();
                                          },
                                          itemCount:
                                              snapshot.data!.docs.length),
                                    );
                            }),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            height: 6.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.h),
                                color: wh.withOpacity(0.3)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: wh,
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: bl,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 2),
                                  child: SizedBox(
                                    height: 5.h,
                                    width: 65.w,
                                    child: TextFormField(
                                      controller: chatcontroll,
                                      autofocus: false,
                                      style: TextStyle(color: wh),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                              fontSize: 11.sp, color: wh),
                                          focusColor: bl,
                                          hintText: "Messege........",
                                          hoverColor: wh),
                                    ),
                                  ),
                                ),
                                StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection('Users')
                                        .where('uid',
                                            isEqualTo: FirebaseAuth
                                                .instance.currentUser!.uid)
                                        .snapshots(),
                                    builder: (context, snapshots) {
                                      // ignore: unused_local_variable
                                      final snap = snapshots.data?.docs[0];
                                      return !snapshots.hasData
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : TextButton(
                                              onPressed: () async {
                                                cant.add(msnapshot.data?.docs
                                                    .toString());
                                                print(cant.toList().toString());

                                                ///  dynamic data = msnapshot.data?.docs['name'];
                                                // if (msnapshot.hasData) {
                                                //   for (var i
                                                //       in msnapshot.data!.docs) {
                                                //     var doc =
                                                //         i['name'].toString();

                                                //     cant.add(doc);

                                                //     print(
                                                //         "-<<<<--------------------------------------------${cant.toList().toString()}------------------------------------------------>>>>>>");
                                                //   }
                                                // } else {
                                                //   print("failed");
                                                // }
                                                // await gcontroll.sendmessege(
                                                //     groupid: id,
                                                //     senderid: msnapshot.data?.docs,
                                                //     reciverid: id,
                                                //     text:
                                                //         chatcontroll.text.toString(),
                                                //     name: snap?['name'],
                                                //     profile: snap?['profile']);

                                                ///   Get.back();
                                              },
                                              child: alltext(
                                                  txt: "Send",
                                                  col: wh,
                                                  siz: 12.sp,
                                                  wei: FontWeight.bold,
                                                  max: 1));
                                    })
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          }),
    );
  }
}
