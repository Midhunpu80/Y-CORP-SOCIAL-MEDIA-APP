import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

class notificationscreen extends StatelessWidget {
  const notificationscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bl,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: wh,
            )),
        title: alltext(
            txt: "Notifications",
            col: wh,
            siz: 12.sp,
            wei: FontWeight.w500,
            max: 1),
        backgroundColor: bl,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('notifications')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('notify')
              .snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 89.h,
                          width: 100.w,
                          color: bl,
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                final snap = snapshot.data?.docs[index];

                                return ListTile(
                                  trailing: snap?['case'] == true
                                      ? Container(
                                          height: 5.h,
                                          width: 10.w,
                                          color: yl,
                                          child: Image(
                                            image: NetworkImage(snap!['img']),
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : Container(
                                          height: 4.h,
                                          width: 25.w,
                                          decoration: BoxDecoration(
                                              color:
                                                  snap?['follower'] ? gy : yl,
                                              borderRadius:
                                                  BorderRadius.circular(1.h)),
                                          child: Center(
                                            child: snap?['follower']
                                                ? alltext(
                                                    txt: "following",
                                                    col: wh,
                                                    siz: 7.sp,
                                                    wei: FontWeight.bold,
                                                    max: 1)
                                                : alltext(
                                                    txt: "FOLLOW",
                                                    col: bl,
                                                    siz: 7.sp,
                                                    wei: FontWeight.bold,
                                                    max: 1),
                                          ),
                                        ),
                                  subtitle: alltext(
                                      txt: snap!['messege'],
                                      col: wh,
                                      siz: 8.sp,
                                      wei: FontWeight.bold,
                                      max: 1),
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(snap['profile']),
                                  ),
                                  title: alltext(
                                      txt: snap?['name'],
                                      col: wh,
                                      siz: 12.sp,
                                      wei: FontWeight.bold,
                                      max: 1),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox();
                              },
                              itemCount: snapshot.data!.docs.length),
                        )
                      ],
                    ),
                  );
          }),
    );
  }
}
