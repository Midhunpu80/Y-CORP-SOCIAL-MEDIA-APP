// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

class viewimagescreen extends StatelessWidget {
  var image;
  var name;
  var profile;


  viewimagescreen({required this.image,required this.name,required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bl,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.more_vert_rounded,
                color: wh,
              ))
        ],
        centerTitle: true,
        backgroundColor: bl,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.close,
              color: wh,
            )),
        title: CircleAvatar(
          radius: 3.h,
          backgroundImage:
              const AssetImage("images/y-high-resolution-logo.png"),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(profile),
              ),
              title: alltext(
                  txt: name,
                  col: wh,
                  siz: 11.sp,
                  wei: FontWeight.bold,
                  max: 1),
              trailing: Icon(
                Icons.more_horiz_rounded,
                color: wh,
              ),
              subtitle: alltext(
                  txt: "time tommy van ",
                  col: wh,
                  siz: 8.sp,
                  wei: FontWeight.bold,
                  max: 1),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            height: 33.h,
            width: 100.w,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover),
                color: gy.withOpacity(0.3)),
          ),
        ],
      ),
    );
  }
}
