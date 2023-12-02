import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/colors.dart';

Widget captionfield({required TextEditingController controller}) {
  return SizedBox(
    width: 65.w,
    height: 10.h,
    child: TextFormField(
      controller: controller,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      style: TextStyle(color: wh, fontSize: 8.sp),
      decoration: InputDecoration(
          hintText: "write captions........",
          hintStyle: TextStyle(color: wh, fontSize: 11.sp),
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}
