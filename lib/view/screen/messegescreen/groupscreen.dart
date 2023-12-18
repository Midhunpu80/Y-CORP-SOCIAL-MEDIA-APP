import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/main.dart';
import 'package:social_syn/view/screen/messegescreen/groupchatscreen/gchatscreen.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/addmemebers.dart';
import 'package:social_syn/view/widgets/creategroup.dart';

class groupscreen extends StatelessWidget {
  final gcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: yl,
          child: Icon(
            Icons.add,
            color: bl,
          ),
          onPressed: () {
            creategroups(context: context, controller: gcontroller);
          }),
      backgroundColor: bl,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('Groups')
              .snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 2.h, top: 4.h),
                              child: SizedBox(
                                  child: alltext(
                                      txt: "Groups",
                                      col: wh,
                                      siz: 12.sp,
                                      wei: FontWeight.bold,
                                      max: 1)),
                            ),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 2.h, top: 3.h),
                              child: Icon(
                                Icons.do_not_disturb_on_total_silence_sharp,
                                color: wh,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          height: 70.h,
                          width: 100.w,
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                final snap = snapshot.data?.docs[index];

                                return Slidable(
                                  endActionPane: ActionPane(
                                      motion: const StretchMotion(),
                                      children: [
                                        SlidableAction(
                                          label: "delete",
                                          onPressed: (va) {
                                            gcontroll.deletegroup(
                                                gid: snap?['groupid']);
                                          },
                                          icon: Icons.delete,
                                          backgroundColor: gy,
                                        ),
                                        SlidableAction(
                                          label: "share",
                                          onPressed: print,
                                          icon: Icons.share,
                                          backgroundColor: gy,
                                        )
                                      ]),
                                  child: ListTile(
                                    onTap: () {
                                      Get.to(() => groupchat_screen(
                                          id: snap['groupid'],
                                          name: snap['gname'],
                                          profile: snap['gimage']));
                                    },
                                    trailing: InkWell(
                                      onTap: () {
                                        addmembersingroup(
                                          context: context,
                                          gpid: snap?['groupid'],
                                          memberid: snap?['AdminiD'],
                                          profile: snap?['gimage'],
                                          gpname: snap?['gname'],
                                        );
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: wh,
                                        child: Icon(
                                          Icons.people,
                                          color: bl,
                                        ),
                                      ),
                                    ),
                                    leading: Stack(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                              NetworkImage(snap?['gimage']),
                                          radius: 4.h,
                                        ),
                                        Positioned(
                                          top: 3.h,
                                          left: 4.h,
                                          child: CircleAvatar(
                                            backgroundColor: wh,
                                            radius: 2.h,
                                            child:
                                                Icon(Icons.person_4_outlined),
                                          ),
                                        )
                                      ],
                                    ),
                                    title: alltext(
                                        txt: snap!['gname'],
                                        col: wh,
                                        siz: 11.sp,
                                        wei: FontWeight.bold,
                                        max: 1),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 2.h,
                                );
                              },
                              itemCount: snapshot.data!.docs.length),
                        )
                      ],
                    ),
                  );
          }),
    );
  }
}
