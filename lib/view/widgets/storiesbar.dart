import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

///List reqdata = ["requirement", "createReq", "Hope", "Sa", "Rock"];
Widget storiesbar() {
  return SliverAppBar(
      leading: const Icon(
        Icons.abc,
        color: Colors.transparent,
      ),
      backgroundColor: bl,
      toolbarHeight:13.h,
      flexibleSpace: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Users').snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    height: 13.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final snap = snapshot.data?.docs[index];

                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 8.h,
                                      width: 16.w,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  snap?['profile']),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(28.h),
                                          border:
                                              Border.all(width: 2, color:const  Color.fromARGB(255, 241, 0, 68))),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  SizedBox(
                                    child: alltext(
                                        txt: snap?['name'],
                                        col: wh,
                                        siz: 8.sp,
                                        wei: FontWeight.bold,
                                        max: 1),
                                  )
                                ],
                              ));
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox();
                        },
                        itemCount: snapshot.data!.docs.length),
                  );
          }));
}
