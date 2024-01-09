import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/main.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/registertextfields.dart';

final cotn = TextEditingController();

class editprofile extends StatelessWidget {
  var id;
  String image;

  editprofile({required this.id, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bl,
      appBar: AppBar(
        toolbarHeight: 10.h,
        title: alltext(
            txt: "Edit Profile",
            col: wh,
            siz: 12.sp,
            wei: FontWeight.bold,
            max: 1),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: wh,
            )),
        backgroundColor: bl,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => usercont.img.value != null
                  ? CircleAvatar(
                      radius: 5.h,
                      backgroundImage: MemoryImage(usercont.img.value!),
                    )
                  : CircleAvatar(
                      radius: 5.h,
                      backgroundImage: NetworkImage(image.toString()),
                    ),
            ),
            TextButton(
              onPressed: () {
                usercont.pick();
              },
              child: alltext(
                  txt: "Edit Profile Picture",
                  col: blu,
                  siz: 11.sp,
                  wei: FontWeight.bold,
                  max: 1),
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 2.h),
              child: Column(
                children: [
                  alltextfields(
                    obsz:  false,
                    messege: "Please enter your email id ",
                      controller: usercont.editname,
                      ico: Icons.lock,
                      hint: "enter your email id",
                      labl: "Name"),
                  SizedBox(
                    height: 3.h,
                  ),
                  alltextfields(
                    obsz:  false,
                    messege: "Please enter your Last name ",
                      controller: usercont.editlast,
                      icos: Icons.remove_red_eye,
                      ico: Icons.location_on,
                      hint: "enter your Lastname",
                      labl: "Last name"),
                  SizedBox(
                    height: 3.h,
                  ),
                  alltextfields(
                    obsz:  false,
                    messege: "Please enter your Your Bio ",
                      controller: usercont.editbio,
                      ico: Icons.lock,
                      hint: "enter your bio",
                      labl: "bio"),
                  SizedBox(
                    height: 3.h,
                  ),
                  alltextfields(
                    obsz:  false,
                    messege: "Please enter your Phone number  ",
                      controller: usercont.editphone,
                      icos: Icons.remove_red_eye,
                      ico: Icons.location_on,
                      hint: "enter your Phone number ",
                      labl: "Phone"),
                  SizedBox(
                    height: 3.h,
                  ),
                  alltextfields(
                    obsz:  false,
                    messege: "Please enter your phone number ",
                      controller: usercont.genders,
                      icos: Icons.remove_red_eye,
                      ico: Icons.location_on,
                      hint: "enter your Phone Gender ",
                      labl: "Gender"),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            SizedBox(
              width: 70.w,
              height: 6.h,
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: yl),
                  onPressed: () {
                    profile_cont.editprofile(
                        profile: usercont.img.value!,
                        id: id,
                        name: usercont.editname.text,
                        lastname: usercont.editlast.text,
                        gender: usercont.genders.text,
                        phone: usercont.editphone.text,
                        bio: usercont.editbio.text);
                  },
                  icon: Icon(
                    Icons.verified,
                    color: wh,
                  ),
                  label: alltext(
                      txt: "save",
                      col: wh,
                      siz: 12.sp,
                      wei: FontWeight.bold,
                      max: 1)),
            )
          ],
        ),
      ),
    );
  }
}
