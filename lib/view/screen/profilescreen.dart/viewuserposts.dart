import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/likeandcommentbar.dart';
import 'package:social_syn/view/widgets/userpostdetails.dart';

class viewuserposts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bl,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            shadowColor: wh.withOpacity(0.3),
            floating: true,
            pinned: true,
            toolbarHeight: 6.h,
            backgroundColor: bl,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: wh,
                )),
            title: alltext(
                txt: "Posts",
                col: wh,
                siz: 13.sp,
                wei: FontWeight.bold,
                max: 1),
          ),
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Posts')
                  .where('uid',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                return SliverList.separated(
                  itemBuilder: (context, index) {
                    final snap = snapshot.data?.docs[index];
                    //// final snap = getposts_controll.reply.post[index];
                    //  final snap2 = getposts_controll.reply.users[index];
                    // final snap3 = getposts_controll.reply.message[index];
                    Timestamp timestamp = snap!["date"];

                    DateTime dateTime = timestamp.toDate();
                    String formattedDateTime =
                        DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
                    String fomttime = DateFormat('hh:mm a').format(dateTime);

                    return !snapshot.hasData
                        ? const Center(child: CircularProgressIndicator())
                        : Padding(
                            padding: EdgeInsets.only(top: 1.h),
                            child: Card(
                              color: wh.withOpacity(0.3),
                              child: Container(
                                height: 85.h,
                                decoration: BoxDecoration(
                                  color: bl,
                                ),
                                child: Column(
                                  children: [
                                    posthead(
                                        postid: snap['postId'],
                                        context: context,
                                        index: index,
                                        name: snap['username'],
                                        profile: snap['profile'],
                                        currentuserid: snap['uid']),
                                    Container(
                                      height: 58.h,
                                      width: 100.w,
                                      decoration: BoxDecoration(

                                          /// borderRadius:
                                          // BorderRadius.circular(2.h),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  snap['photourl'].toString()),
                                              fit: BoxFit.cover)),
                                    ),
                                    like_and_commentbar(
                                      context: context,
                                      ind: index,
                                      likes: "${snap['Likes'].length}",
                                      commentsa: "3",
                                      postid: snap['postId'],
                                      likess: snap['Likes'],
                                      uid: snap['uid'],
                                      date: null,
                                      photourl: null,
                                      captions: null,
                                      username: [],
                                      comments: [],
                                      profile: null,
                                    ),
                                    descriptionbar(des: snap['captions']),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 1.h, top: 2.h),
                                      child: SizedBox(
                                        height: 2.h,
                                        width: 100.w,
                                        child: alltext(
                                            txt: "Time: ${fomttime.toString()}",
                                            col: gy,
                                            siz: 8.sp,
                                            wei: FontWeight.bold,
                                            max: 1),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 1.h),
                                      child: Container(
                                        height: 2.h,
                                        width: 100.w,
                                        child: alltext(
                                            txt:
                                                "Published : ${formattedDateTime.toString().substring(0, 11)}",
                                            col: gy,
                                            siz: 8.sp,
                                            wei: FontWeight.bold,
                                            max: 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: gy,
                    );
                  },
                  itemCount: !snapshot.hasData ? 0 : snapshot.data!.docs.length,
                );
              })
        ],
      ),
    );
  }
}
