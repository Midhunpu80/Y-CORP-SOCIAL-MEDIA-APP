import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/main.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

commentsmessenger(
  BuildContext? context, {
  required var uid,
  required var postid,
}) {
  return showBottomSheet(
      context: context!,
      builder: (context) {
        return SafeArea(
          child: Container(
            height: 86.h,
            width: 100.w,
            color: bl.withOpacity(0.9),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    height: 1.h,
                    width: 10.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.h), color: wh),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    child: alltext(
                        txt: "comments",
                        col: wh,
                        siz: 10.sp,
                        wei: FontWeight.w500,
                        max: 1),
                  ),
                  const Divider(),
                  showcommentsList(ind: 0, postid: postid),
                  sendcomment(
                    uid: uid,
                    postid: postid,
                  )
                ],
              ),
            ),
          ),
        );
      });
}

sendcomment({
  required var uid,
  required var postid,
}) {
  final comment_contr = TextEditingController();
  return SizedBox(
    height: 10.h,
    width: 100.w,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            final snap = snapshot.data!.docs[0];
            return !snapshot.hasData
                ? const SizedBox()
                : SingleChildScrollView(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(snap['profile']),
                        ),
                        SizedBox(
                          width: 2.h,
                        ),
                        SizedBox(
                          height: 5.h,
                          width: 68.w,
                          child: TextFormField(
                            controller: comment_contr,
                            style: TextStyle(color: wh, fontSize: 10.sp),
                            decoration: InputDecoration(
                                hintText: "Write something",
                                hintStyle:
                                    TextStyle(color: wh, fontSize: 8.sp)),
                          ),
                        ),
                        IconButton(
                            onPressed: () async {
                              await postcont.postcomment(
                                uid: uid,
                                postid: postid,
                                text: comment_contr.text.toString(),
                                profile: snap['profile'].toString(),
                                name: snap['name'].toString(),
                              );
                            },
                            icon: Icon(
                              Icons.send,
                              color: wh,
                            ))
                      ],
                    ),
                  );
          }),
    ),
  );
}

showcommentsList({required var ind, required var postid}) {
  return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Posts')
          .doc(postid)
          .collection('Commentss')
          .snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? const Center(child: CircularProgressIndicator())
            : Container(
                height: 65.h,
                width: 100.w,
                color: bl.withOpacity(0.2),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      final snap = snapshot.data!.docs[index];
                      Timestamp timestamp = snap["date"];
                      DateTime dateTime = timestamp.toDate();
                      String formattedDateTime =
                          DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
                      return ListTile(
                        trailing: IconButton(
                            onPressed: () async {
                              await postcont.deltethecomment(
                                  postid: snap['postId'],
                                  commentid: snap['commentid'].toString());
                            },
                            icon: Icon(
                              Icons.more_vert_rounded,
                              color: wh,
                            )),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(snap['profile']),
                          radius: 2.h,
                        ),
                        title: alltext(
                            txt:
                                "${snap['name']}    ${formattedDateTime.toString().substring(0, 11)}",
                            col: wh,
                            siz: 9.sp,
                            wei: FontWeight.w600,
                            max: 1),
                        subtitle: alltext(
                            txt: snap['text'].toString(),
                            col: wh,
                            siz: 7.sp,
                            wei: FontWeight.w500,
                            max: null),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox();
                    },
                    itemCount: snapshot.data!.docs.length),
              );
      });
}
