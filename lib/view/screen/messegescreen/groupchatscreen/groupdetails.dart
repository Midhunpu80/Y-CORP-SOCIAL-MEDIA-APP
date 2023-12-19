// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

class groupdetailsscreen extends StatelessWidget {
  groupdetailsscreen(
      {required this.gid, required this.name, required this.profile});
  var gid;
  var name;
  var profile;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bl,
      appBar: AppBar(
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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('memebers')
              .doc(gid)
              .collection('all')
              .snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: 6.h,
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          child: alltext(
                              txt: name,
                              col: wh,
                              siz: 15.sp,
                              wei: FontWeight.bold,
                              max: 1),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          child: alltext(
                              txt: "Group ${snapshot.data?.docs.length.toString()} memmbers",
                              col: wh,
                              siz: 11.sp,
                              wei: FontWeight.bold,
                              max: 1),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                                onTap: () {},
                                child: videocallbutton(
                                    data: Icons.audiotrack_sharp,
                                    txt: "Audio")),
                            InkWell(
                              onTap: () {},
                              child: videocallbutton(
                                  data: Icons.video_camera_back_sharp,
                                  txt: "Video"),
                            ),
                            InkWell(
                                onTap: () {},
                                child: videocallbutton(
                                    data: Icons.add, txt: "Add")),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 45.h,
                            width: 100.w,
                            color: gy.withOpacity(0.2),
                            child: ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  final snap = snapshot.data?.docs[index];

                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(snap?['profile']),
                                    ),
                                    subtitle: alltext(
                                        txt: snap?['name'],
                                        col: re,
                                        siz: 6.sp,
                                        wei: FontWeight.bold,
                                        max: 1),
                                    title: alltext(
                                        txt: snap?['name'],
                                        col: wh,
                                        siz: 9.sp,
                                        wei: FontWeight.bold,
                                        max: 1),
                                  );
                                }),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 1.h, left: 1.h),
                          child: Container(
                            height: 7.h,
                            width: 100.w,
                            color: gy.withOpacity(0.2),
                            child: ListTile(
                              leading: Icon(
                                Icons.login,
                                color: re,
                              ),
                              title: alltext(
                                  txt: "Report",
                                  col: re,
                                  siz: 11.sp,
                                  wei: FontWeight.bold,
                                  max: 1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 1.h, left: 1.h),
                          child: Container(
                            height: 7.h,
                            width: 100.w,
                            color: gy.withOpacity(0.2),
                            child: ListTile(
                              leading: Icon(
                                Icons.report,
                                color: re,
                              ),
                              title: alltext(
                                  txt: "Report",
                                  col: re,
                                  siz: 11.sp,
                                  wei: FontWeight.bold,
                                  max: 1),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
          }),
    );
  }
}

Widget videocallbutton({required var txt, required IconData data}) {
  return Container(
    height: 10.h,
    width: 30.w,
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: wh),
      borderRadius: BorderRadius.circular(2.h),
      color: gy.withOpacity(0.2),
    ),
    child: Center(
        child: Column(
      children: [
        SizedBox(
          height: 1.h,
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              data,
              color: wh,
              size: 4.h,
            )),
        alltext(txt: txt, col: wh, siz: 8.sp, wei: FontWeight.bold, max: 1),
      ],
    )),
  );
}
