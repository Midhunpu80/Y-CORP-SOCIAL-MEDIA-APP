import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/colors.dart';

alltextfields(
    {required IconData ico,
    TextEditingController? controller,
    required var hint,
    required var labl,
    IconData? icos}) {
  return SizedBox(
    height: 6.h,
    width: 90.w,
    child: TextFormField(
      controller: controller,
      style: TextStyle(color: wh, fontSize: 12.sp),
      decoration: InputDecoration(
          // fillColor: gy.withOpacity(0.1),
          //filled: true,
          hoverColor: wh,

          // border: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(1.h)),
          labelText: labl,
          hintText: hint,
          labelStyle: TextStyle(fontSize: 9.sp, color: wh),
          hintStyle:
              TextStyle(color: wh, fontSize: 8.sp, fontWeight: FontWeight.w300),
          suffixIcon: Icon(
            icos,
            color: wh,
            size: 2.h,
          ),
          prefixIcon: Icon(
            ico,
            color: wh,
            size: 2.h,
          )),
    ),
  );
}
