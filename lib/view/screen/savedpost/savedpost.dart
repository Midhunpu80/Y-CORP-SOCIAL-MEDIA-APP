import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

class savedpost_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('saves')
            .snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  backgroundColor: bl,
                  appBar: AppBar(
                    toolbarHeight: 10.h,
                    leading: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: wh,
                        )),
                    backgroundColor: bl,
                    title: alltext(
                        txt: "Saved",
                        col: wh,
                        siz: 12.sp,
                        wei: FontWeight.bold,
                        max: 1),
                  ),
                  // ignore: prefer_const_constructors
                  body: GridView.builder(
                      itemCount: snapshot.data!.docs.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 1.h,
                          mainAxisSpacing: 1.h),
                      itemBuilder: (context, index) {
                        final snap = snapshot.data!.docs[index];
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            height: 10.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(snap['photourl']))),
                          ),
                        );
                      }),
                );
        });
  }
}
