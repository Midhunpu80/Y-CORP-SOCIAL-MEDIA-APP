import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

class messegeview_screen extends StatelessWidget {
  const messegeview_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        actions: const [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.call),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.video_call_rounded),
          )
        ],
        toolbarHeight: 10.h,
        leading: FittedBox(
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: bl,
                    size: 15.h,
                  )),
              SizedBox(
                width: 15.w,
              ),
              CircleAvatar(
                radius: 8.h,
              )
            ],
          ),
        ),
        backgroundColor: yl,
        title: alltext(
            txt: "Midhunpu", col: bl, siz: 11.sp, wei: FontWeight.w400, max: 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 78.h,
              width: 100.w,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: index.isEven
                          ? Container(
                              height: 2.h,
                              margin: EdgeInsets.only(left: 30.h),
                              decoration: BoxDecoration(
                                  color: yl,
                                  borderRadius: BorderRadius.circular(2.h)),
                              child: Center(
                                child: alltext(
                                    txt: "some name*" * 120,
                                    col: bl,
                                    siz: 8.sp,
                                    wei: FontWeight.bold,
                                    max: 1),
                              ))
                          : Container(
                              margin: EdgeInsets.only(right: 30.h),
                              height: 2.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                  color: pp,
                                  borderRadius: BorderRadius.circular(2.h)),
                              child: Center(
                                child: alltext(
                                    txt: "some name ",
                                    col: bl,
                                    siz: 8.sp,
                                    wei: FontWeight.bold,
                                    max: 1),
                              )),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox();
                  },
                  itemCount: 38),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                height: 6.h,
                width: 100.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.h), color: blu),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: wh,
                        child: Icon(
                          Icons.camera_alt,
                          color: bl,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: SizedBox(
                        height: 5.h,
                        width: 65.w,
                        child: TextFormField(
                          autofocus: false,
                          style: TextStyle(color: wh),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 11.sp, color: wh),
                              focusColor: bl,
                              hintText: "Messege........",
                              hoverColor: wh),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: alltext(
                            txt: "Send",
                            col: wh,
                            siz: 12.sp,
                            wei: FontWeight.bold,
                            max: 1))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
