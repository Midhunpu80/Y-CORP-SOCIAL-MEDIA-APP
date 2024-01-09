import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/main.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/captionfields.dart';

class writepost extends StatelessWidget {
  final TextEditingController caption = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          final snap = snapshot.data?.docs[0];
          return !snapshot.hasData
              ? const Center(child: CircularProgressIndicator())
              : Scaffold(
                  appBar: AppBar(
                    actions: [
                      IconButton(
                          onPressed: () {
                            Get.back();

                            postcont.postthepost(
                                file: usercont.img.value!,
                                uid: snap!['uid'],
                                profile: snap['profile'],
                                username: snap['name'],
                                captions: caption.text);
                          },
                          icon: Icon(
                            Icons.check,
                            color: blu,
                          ))
                    ],
                    title: alltext(
                        txt: "New Post",
                        col: wh,
                        siz: 12.sp,
                        wei: FontWeight.bold,
                        max: 1),
                    backgroundColor: bl,
                    leading: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: wh,
                        )),
                  ),
                  backgroundColor: bl,
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 18.h,
                          width: 100.w,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundColor: blu,
                                  radius: 3.h,
                                  backgroundImage:
                                      NetworkImage(snap!['profile'].toString()),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 0.h),
                                  child: captionfield(controller: caption),
                                ),
                                Obx(
                                  () => usercont.img.value == null
                                      ? Container(
                                          height: 6.h,
                                          width: 13.w,
                                          decoration: BoxDecoration(

                                              /// image: DecorationImage(image: asse(usercont.img.value!)),
                                              borderRadius:
                                                  BorderRadius.circular(1.h),
                                              color: yl),
                                        )
                                      : Container(
                                          height: 6.h,
                                          width: 13.w,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: MemoryImage(
                                                      usercont.img.value!),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                                  BorderRadius.circular(1.h),
                                              color: yl),
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Obx(
                            () => usercont.img.value == null
                                ? Container()
                                : Container(
                                    height: 60.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 2, color: wh),
                                        image: DecorationImage(
                                            image: MemoryImage(
                                                usercont.img.value!),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(2.h),
                                        color: blu.withOpacity(0.3)),
                                  ),
                          ),
                        )
                      ],
                    ),
                  ));
        });
  }
}
