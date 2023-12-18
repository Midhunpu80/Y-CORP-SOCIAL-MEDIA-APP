import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/main.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

addmembersingroup(
    {required BuildContext context,
    required var gpid,
    required var memberid,
    required var profile,
    required var gpname}) {
  return showBottomSheet(
      context: context,
      builder: (context) {
        return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Users')
                .doc(memberid)
                .collection('Groups')
                .doc(gpid)
                .collection('memebers')
                .snapshots(),
            builder: (context, snapshotss) {
              final membersList = snapshotss.data?.docs;

              return !snapshotss.hasData
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      height: 60.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(3.h),
                              topRight: Radius.circular(3.h)),
                          color: bl.withOpacity(0.8)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          alltext(
                              txt: "Add memebers",
                              col: wh,
                              siz: 11.sp,
                              wei: FontWeight.bold,
                              max: 1),
                          const Divider(),
                          StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('Users')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                return !snapshot.hasData
                                    ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : SizedBox(
                                        height: 50.h,
                                        width: 100.w,
                                        child: ListView.separated(
                                            itemBuilder: (context, index) {
                                              final snap =
                                                  snapshot.data?.docs[index];
                                              bool isdoc = false;
                                              if (membersList != null) {
                                                for (var doc in membersList) {
                                                  if (doc.id == snap!.id) {
                                                    isdoc = true;
                                                    break;
                                                  }
                                                }
                                              }

                                              return ListTile(
                                                trailing: InkWell(
                                                  onTap: () async {
                                                    print(snap?['name']);
                                                    await gcontroll.addmembers(
                                                      ishere: isdoc,
                                                      gpid: gpid,
                                                      memberid: snap?['uid'],
                                                      gprofile: profile,
                                                      gname: gpname,
                                                      memberprofile:
                                                          snap?['profile'],
                                                      membername: snap?['name'],
                                                    );
                                                  },
                                                  child: isdoc
                                                      ? Icon(
                                                          Icons.remove,
                                                          color: wh,
                                                        )
                                                      : Icon(
                                                          Icons.add,
                                                          color: wh,
                                                        ),
                                                ),
                                                leading: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      snap?['profile']),
                                                ),
                                                title: alltext(
                                                    txt: snap?['name'],
                                                    col: wh,
                                                    siz: 11.sp,
                                                    wei: FontWeight.bold,
                                                    max: 1),
                                              );
                                            },
                                            separatorBuilder: (context, index) {
                                              return const SizedBox();
                                            },
                                            itemCount:
                                                snapshot.data!.docs.length),
                                      );
                              }),
                        ],
                      ),
                    );
            });
      });
}
