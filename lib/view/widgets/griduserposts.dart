import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/screen/profilescreen.dart/viewuserposts.dart';

Widget usergrid_post({required var snaps, required itemcount}) {
  return SliverGrid.builder(
    // ignore: prefer_const_constructors
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 2),
    itemBuilder: (context, index) {
      final snap = snaps[index];

      return InkWell(
        onTap: () {
          Get.to(viewuserposts());
        },
        child: Container(
          height: 10.h,
          width: 50.w,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(snap!["photourl"]), fit: BoxFit.cover)),
        ),
      );
    },

    itemCount: itemcount,
  );
}
