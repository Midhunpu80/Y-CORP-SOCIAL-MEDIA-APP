import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/service/followingandunfollowing/following.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/buttons.dart';
import 'package:social_syn/view/utility/colors.dart';

class allusers_screen extends StatelessWidget {
  following_service newfollow = following_service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bl,
      appBar: AppBar(
        actions: [
          messegebutton(),
          notificationbutton(),
        ],
        toolbarHeight: 10.h,
        leading: Icon(
          Icons.group,
          color: wh,
        ),
        backgroundColor: bl,
        title: alltext(
            txt: "All users",
            col: wh,
            siz: 13.sp,
            wei: FontWeight.bold,
            max: 1),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Users').snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? Center(child: CircularProgressIndicator())
                : Container(
                    height: 100.h,
                    width: 100.w,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final snap = snapshot.data!.docs[index];
                          return Container(
                            height: 10.h,
                            width: 100.w,
                            child: ListTile(
                              onTap: () async {
                               
                              },
                              trailing: InkWell(
                                onTap: ()async{
                                   await newfollow.followingtheuser(
                                    usersid: snap.id,
                                    uid: FirebaseAuth.instance.currentUser!.uid,
                                    following: snap['following'],
                                    followers: snap['following'],
                                    name: snap['name'],
                                    lastname: snap['last name'],
                                    profile: snap['profile']);
                                },
                                child: Container(
                                  height: 4.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                      color: snap['following']
                                              .toString()
                                              .contains(FirebaseAuth
                                                  .instance.currentUser!.uid)
                                          ? gy
                                          : blu,
                                      borderRadius: BorderRadius.circular(1.h)),
                                  child: Center(
                                    child: snap['following'].toString().contains(
                                            FirebaseAuth
                                                .instance.currentUser!.uid)
                                        ? alltext(
                                            txt: "following",
                                            col: wh,
                                            siz: 7.sp,
                                            wei: FontWeight.bold,
                                            max: 1)
                                        : alltext(
                                            txt: "FOLLOW",
                                            col: wh,
                                            siz: 7.sp,
                                            wei: FontWeight.bold,
                                            max: 1),
                                  ),
                                ),
                              ),
                              subtitle: alltext(
                                  txt: "",
                                  col: wh.withOpacity(0.5),
                                  siz: 8.sp,
                                  wei: FontWeight.bold,
                                  max: 1),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(snap['profile']),
                                radius: 3.h,
                              ),
                              title: alltext(
                                  txt: snap['name'],
                                  col: wh,
                                  siz: 11.sp,
                                  wei: FontWeight.bold,
                                  max: 1),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox();
                        },
                        itemCount: snapshot.data!.docs.length),
                  );
          }),
    );
  }
}
