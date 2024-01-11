import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/screen/viewimagescreen/viewimagescreen.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/deletemodelsheet.dart';
import 'package:social_syn/view/widgets/likeandcommentbar.dart';

Widget userpostdatasList(
  BuildContext context,

//  required var caption,required var name, required var time,required var image,required var profile
) {
  return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('Posts').orderBy('time',descending: true).snapshots(),
      builder: (context, snapshot) {
        return SliverList.separated(
          itemBuilder: (context, index) {
            final snap = snapshot.data!.docs[index];

            /// print(snap!['photourl']);

            Timestamp timestamp = snap["date"];
            DateTime dateTime = timestamp.toDate();
            String formattedDateTime =
                DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
            String fomttime = DateFormat('hh:mm a').format(dateTime);

            return !snapshot.hasData
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      ///  height: 91.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(2.h),
                            topRight: Radius.circular(2.h)),
                        color: bl,
                      ),
                      child: Column(
                        children: [
                          posthead(
                              image: snap['photourl'].toString(),
                              descriptionz: "data",
                              currentuserid: snap['uid'],
                              context: context,
                              index: index,
                              name: snap['username'],
                              profile: snap['profile'],
                              postid: snap['postId']),
                          Padding(
                            padding: EdgeInsets.only(left: 5.h),
                            child: SizedBox(
                                width: 85.w,
                                child: descriptionbar(des: snap['captions'])),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.h, top: 1.h),
                            child: InkWell(
                              onTap: () {
                                Get.to(() => viewimagescreen(
                                    name: snap['username'],
                                    profile: snap['profile'],
                                    image: snap['photourl'].toString()));
                              },
                              child: Container(
                                height: 32.h,
                                width: 85.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          snap['photourl'].toString()),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(2.h),
                                ),
                                // child: Image(
                                //   image:
                                //       NetworkImage(snap['photourl'].toString()),
                                //   fit: BoxFit.cover,
                                // ),
                              ),
                            ),
                          ),
                          like_and_commentbar(
                            context: context,
                            ind: index,
                            likes: "${snap['Likes'].length}",
                            commentsa: ['comments'],
                            postid: snap['postId'],
                            likess: snap['Likes'],
                            uid: snap['uid'],
                            photourl: snap['photourl'],
                            date: snap['time'],
                            captions: snap['captions'],
                            username: snap['username'],
                            profile: snap['profile'],
                            comments: snap['comments'],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 1.h, top: 1.h),
                            child: SizedBox(
                              height: 2.h,
                              width: 100.w,
                              child: alltext(
                                  txt: "Time: ${fomttime.toString()}",
                                  col: gy,
                                  siz: 7.sp,
                                  wei: FontWeight.bold,
                                  max: 1),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 1.h),
                            child: SizedBox(
                              height: 2.h,
                              width: 100.w,
                              child: alltext(
                                  txt:
                                      "Published : ${formattedDateTime.toString().substring(0, 11)}",
                                  col: gy,
                                  siz: 7.sp,
                                  wei: FontWeight.bold,
                                  max: 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
          separatorBuilder: (context, index) {
            return Container(
              height: 2,
              color: wh.withOpacity(0.1),
            );
          },
          itemCount: !snapshot.hasData ? 0 : snapshot.data!.docs.length,
        );
      });
}

Widget posthead(
    {required var image,
    required var descriptionz,
    required var currentuserid,
    required var index,
    required var name,
    required var profile,
    required BuildContext context,
    required var postid}) {
  return Card(
    color: bl,
    child: Container(
        height: 8.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(1.h), topRight: Radius.circular(1.h)),
        ),
        child: ListTile(
          subtitle: alltext(
              txt: "midh", col: wh, siz: 8.sp, wei: FontWeight.w400, max: 1),
          leading: Container(
            height: 5.h,
            width: 10.w,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: wh),
                image: DecorationImage(
                    image: NetworkImage(
                      profile,
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(80.h),
                color: yl),
          ),
          title: alltext(
              txt: name, col: wh, siz: 12.sp, wei: FontWeight.w500, max: 1),
          trailing: IconButton(
            onPressed: () {
              print("-------------------->${postid.toString()}");
              deleteandeditmodelsheet(context,
                  image: image,
                  descriptions: descriptionz,
                  name: name,
                  profile: profile,
                  postid: postid,
                  uid: currentuserid);
            },
            icon: Icon(
              Icons.more_vert_outlined,
              color: wh,
            ),
          ),
        )),
  );
}
