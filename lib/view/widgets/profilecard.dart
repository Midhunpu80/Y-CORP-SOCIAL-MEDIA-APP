import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/main.dart';
import 'package:social_syn/view/screen/editprofile/editprofile.dart';
import 'package:social_syn/view/service/followingandunfollowing/following.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

profilecard(
    {required dynamic snapsss,
    required var snapid,
    required var name,
    required var folllowing,
    required var followrs,
    required var phone,
    required var id,
    required var gender,
    required var bio,
    required var lastname,
    required var profileimg}) {
  following_service follows = following_service();
  bool isdoc = false;
  if (snapsss != null) {
    for (var doc in snapsss) {
      if (doc.id == snapid) {
        isdoc = true;
        break;
      }
    }
  }
  return SliverAppBar(
    leading: const Icon(
      Icons.abc_outlined,
      color: Colors.transparent,
    ),
    toolbarHeight: 38.h,
    backgroundColor: bl,
    flexibleSpace: Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 19.h,
              width: 30.w,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(profileimg.toString()),
                      radius: 5.h,
                      backgroundColor: wh,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  alltext(
                      txt: name,
                      col: wh,
                      siz: 10.sp,
                      wei: FontWeight.bold,
                      max: 1),
                  Icon(
                    Icons.track_changes_rounded,
                    color: wh,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
              width: 70.w,
              child: Column(
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      countoffollowing(txt: "2"),
                      countoffollowing(txt: followrs.toString()),
                      countoffollowing(txt: folllowing.toString())
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      countoffollowing(txt: "    Posts"),
                      countoffollowing(txt: "Followers"),
                      countoffollowing(txt: "Following")
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 0.h, left: 2.h),
          child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                  height: 5.h,
                  width: 80.w,
                  child: ExpandableText(
                    bio,
                    expandText: 'show more',
                    collapseText: 'show less',
                    maxLines: 5,
                    style: TextStyle(color: wh, fontSize: 9.sp),
                    linkColor: Colors.blue,
                  ))),
        ),
        Row(
          children: [
            FirebaseAuth.instance.currentUser!.uid.toString() == id.toString()
                ? InkWell(
                    onTap: () {
                      Get.to(() => editprofile(
                            image: profileimg,
                            id: id,
                          ));
                      usercont.editdatas(
                          name: name,
                          lastname: lastname.toString(),
                          bio: bio.toString(),
                          phone: phone,
                          gender: gender.toString());
                    },
                    child: twobuttons(
                        txt: "EditProfile", col: wh.withOpacity(0.3)))
                : InkWell(
                    onTap: () async {
                      await follows.followingtheuser(
                          istru: isdoc,
                          uid: FirebaseAuth.instance.currentUser?.uid,
                          usersid: snapid.toString());
                    },
                    child: twobuttons(
                        txt: isdoc ? "following" : "Follow",
                        col: isdoc ? wh.withOpacity(0.3) : yl)),
            twobuttons(txt: "shareprofile", col: wh.withOpacity(0.3)),
          ],
        ),
        SizedBox(
          height: 3.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.grid_4x4_outlined,
                  color: wh,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.save_rounded,
                  color: wh,
                ))
          ],
        )
      ],
    ),
  );
}

Widget countoffollowing({required var txt}) {
  return Container(
    child: alltext(txt: txt, col: wh, siz: 11.sp, wei: FontWeight.bold, max: 1),
  );
}

Widget twobuttons({required var txt, required Color col}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      height: 4.h,
      width: 47.w,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(1.h), color: col),
      child: Center(
          child: alltext(
              txt: txt, col: wh, siz: 8.sp, wei: FontWeight.bold, max: 1)),
    ),
  );
}
