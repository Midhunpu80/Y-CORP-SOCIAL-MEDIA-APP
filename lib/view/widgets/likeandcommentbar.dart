import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/comments.dart';

// Widget userpostimage(BuildContext context, var index) {

// }

like_and_commentbar(
    {required BuildContext context,
    var ind,
    required var likes,
    required var commentsa}) {
  return Container(
    height: 7.h,
    color: bl,
    width: 100.w,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Row(
            children: [
              CircleAvatar(
                  radius: 19,
                  backgroundColor: wh.withOpacity(0.3),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_outline,
                        size: 2.h,
                        color: wh,
                      ))),
              SizedBox(
                width: 2.w,
              ),
              alltext(
                  txt: likes.toString(),
                  col: bl,
                  siz: 9.sp,
                  wei: FontWeight.bold,
                  max: 1)
            ],
          ),
          SizedBox(
            width: 2.w,
          ),
          Row(
            children: [
              CircleAvatar(
                  radius: 19,
                  backgroundColor: wh.withOpacity(0.3),
                  child: IconButton(
                      onPressed: () {
                        commentsmessenger(context);
                      },
                      icon: Icon(
                        Icons.messenger_outline_outlined,
                        size: 2.h,
                        color: wh,
                      ))),
              SizedBox(
                width: 2.w,
              ),
              alltext(
                  txt: commentsa.toString(),
                  col: bl,
                  siz: 9.sp,
                  wei: FontWeight.bold,
                  max: 1)
            ],
          ),
          Spacer(),
          CircleAvatar(
              radius: 19,
              backgroundColor: wh.withOpacity(0.3),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark,
                    color: wh,
                    size: 2.h,
                  ))),
        ],
      ),
    ),
  );
}

Widget descriptionbar({required var des}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 8.h,
      width: 100.w,

      //  decoration: BoxDecoration(),
      child: alltext(
          txt: "wrongh" * 102, col: wh, siz: 8.sp, wei: FontWeight.w400, max: 4),
    ),
  );
}
