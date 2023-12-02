import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/controller/usercontroller%20.dart';
import 'package:social_syn/main.dart';
import 'package:social_syn/view/screen/createpost/writepost.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

class create_postscreen extends StatelessWidget {
  const create_postscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bl,
      appBar: AppBar(
        backgroundColor: bl,
        title: alltext(
            txt: "Create Post",
            col: wh,
            siz: 12.sp,
            wei: FontWeight.bold,
            max: 1),
      ),
      body: Column(
        children: [
          Obx(() => postcont.isloading.value?LinearProgressIndicator():Container()),
          Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: Center(
                child: InkWell(
              onTap: () {
                usercont.pick();

                Get.to(() => writepost());
                
              },
              child: CircleAvatar(
                backgroundColor: wh.withOpacity(0.3),
                radius: 8.h,
                child: Icon(
                  Icons.add,
                  size: 5.h,
                  color: wh,
                ),
              ),
            )),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            child: Center(
              child: alltext(
                  txt: "  Create \nNew Post",
                  col: wh,
                  siz: 22.sp,
                  wei: FontWeight.bold,
                  max: 3),
            ),
          )
        ],
      ),
    );
  }
}
