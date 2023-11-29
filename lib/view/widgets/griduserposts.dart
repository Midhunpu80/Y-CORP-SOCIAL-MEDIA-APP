import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/colors.dart';

Widget usergrid_post() {
  return SliverGrid.builder(
      // ignore: prefer_const_constructors
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemBuilder: (context, index) {
        return Container(
          height: 10.h,
          width: 50.w,
          color: blu,
        );
      });
}
