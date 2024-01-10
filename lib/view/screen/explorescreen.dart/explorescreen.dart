import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/buttons.dart';
import 'package:social_syn/view/utility/colors.dart';

class explorescreem extends StatelessWidget {
  const explorescreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bl,
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Posts').snapshots(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          leading: Icon(
                            Icons.explore,
                            color: wh,
                          ),
                          actions: [
                            messegebutton(context),
                            notificationbutton(),
                          ],
                          toolbarHeight: 8.h,
                          backgroundColor: bl,
                          title: alltext(
                              txt: "Explore",
                              col: wh,
                              siz: 13.sp,
                              wei: FontWeight.bold,
                              max: 2),
                        ),
                        SliverGrid.builder(
                            itemCount: snapshot.data!.docs.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 2),
                            itemBuilder: (context, index) {
                              final snap = snapshot.data?.docs[index];
                              return Container(
                                height: 10.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                    color: gy.withOpacity(0.3),
                                    image: DecorationImage(
                                        image: NetworkImage(snap!['photourl']),
                                        fit: BoxFit.cover)),
                              );
                            })
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            }));
  }
}
