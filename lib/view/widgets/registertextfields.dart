import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/controller/bottomcontroller.dart';
import 'package:social_syn/main.dart';
import 'package:social_syn/view/utility/colors.dart';

alltextfields(
    {required var messege,
    required IconData ico,
    TextEditingController? controller,
    required var hint,
    required var labl,
    IconData? icos}) {
  return SizedBox(
    height: 6.h,
    width: 90.w,
    child: Obx(
      () => TextFormField(
        obscuringCharacter: '*',
        obscureText: bottomct.obs.value,
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
            hintStyle: TextStyle(
                color: wh, fontSize: 8.sp, fontWeight: FontWeight.w300),
            suffixIcon: InkWell(
              onTap: () {
                bottomct.change();
              },
              child: Icon(
                icos,
                color: bottomct.obs.value ? wh : re,
                size: 2.h,
              ),
            ),
            prefixIcon: Icon(
              ico,
              color: wh,
              size: 2.h,
            )),
        validator: (value) {
          if (value!.isEmpty || value == null) {
            return messege;
          } else {
            return null;
          }
        },
      ),
    ),
  );
}
