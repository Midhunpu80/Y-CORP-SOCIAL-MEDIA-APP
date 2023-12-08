import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/screen/messegescreen/messegeview_screen.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

Widget allusersList() {
  return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Users').snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? const Center(child: CircularProgressIndicator())
            : Container(
                height: 80.h,
                width: 100.w,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      final snap = snapshot.data!.docs[index];
                      return Container(
                        height: 10.h,
                        width: 100.w,
                        child: ListTile(
                          subtitle: alltext(
                              txt: snap['name'],
                              col: wh.withOpacity(0.8),
                              siz: 8.sp,
                              wei: FontWeight.w400,
                              max: 1),
                          onTap: () {
                            Get.to(() => messegeview_screen(name: snap['name'],id: snap['uid'],profile: snap['profile'],));
                          },
                          trailing: Icon(
                            Icons.camera_alt_outlined,
                            color: wh,
                          ),
                          leading: CircleAvatar(
                            radius: 3.h,
                            backgroundImage: NetworkImage(snap['profile']),
                          ),
                          title: alltext(
                              txt: snap['name'],
                              col: wh,
                              siz: 10.sp,
                              wei: FontWeight.w900,
                              max: 1),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(color: gy.withOpacity(0.2),);
                    },
                    itemCount: snapshot.data!.docs.length),
              );
      });
}
