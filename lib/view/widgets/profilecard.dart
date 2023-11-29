import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

profilecard({required var name ,required var folllowing,required var followrs}) {
  return SliverAppBar(
    leading: Icon(
      Icons.abc_outlined,
      color: Colors.transparent,
    ),
    toolbarHeight: 38.h,
    backgroundColor: bl,
    flexibleSpace: Column(
      children: [
        Row(
          children: [
            Container(
              height: 20.h,
              width: 30.w,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: CircleAvatar(
                      radius: 6.h,
                      backgroundColor: wh,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  alltext(
                      txt:name,
                      col: wh,
                      siz: 10.sp,
                      wei: FontWeight.bold,
                      max: 1)
                ],
              ),
            ),
            Container(
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
                      countoffollowing(txt: "Posts"),
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
          padding: const EdgeInsets.all(8.0),
          child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                  height: 5.h,
                  child: alltext(
                      txt: "decnhfbjdbjhdbjdfbjhdfbjbf",
                      col: wh,
                      siz: 8 .sp,
                      wei: FontWeight.w500,
                      max: 1))),
        ),
        Row(
          children: [
            twobuttons(txt: "EditProfile"),
            twobuttons(txt: "shareprofile"),
          ],
        ),
        SizedBox(height: 3.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.grid_4x4_outlined,color: wh,)),
             IconButton(onPressed: (){}, icon: Icon(Icons.save_rounded,color: wh,))
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

Widget twobuttons({required var txt}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      height: 4.h,
      width: 47.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.h), color: wh.withOpacity(0.6)),
      child: Center(
          child: alltext(
              txt: txt, col: wh, siz: 8.sp, wei: FontWeight.bold, max: 1)),
    ),
  );
}

