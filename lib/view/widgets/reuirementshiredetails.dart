// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

reuirement_hire_details(BuildContext context,
    {required var budget,
    required var location,
    required var person,
    required var intrested,
    required var messege}) {
  return showBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Container(
            height: 55.h,
            width: 100.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3.h),
                  topRight: Radius.circular(3.h),
                ),
                color: pp.withOpacity(0.3)),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 1.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.h), color: wh),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: 10.h,
                        width: 90.w,
                        child: alltext(
                            txt: messege,
                            col: bl,
                            siz: 15.sp,
                            wei: FontWeight.bold,
                            max: 3)),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextButton.icon(
                      onPressed: null,
                      icon: Icon(
                        Icons.attach_money_sharp,
                        color: bl,
                      ),
                      label: alltext(
                          txt: "Budget:${budget.toString()}",
                          col: bl,
                          siz: 11.sp,
                          wei: FontWeight.w500,
                          max: 3)),
                  TextButton.icon(
                      onPressed: null,
                      icon: Icon(
                        Icons.location_on_outlined,
                        color: bl,
                      ),
                      label: alltext(
                          txt: "Location:$location,Kerala,India",
                          col: bl,
                          siz: 11.sp,
                          wei: FontWeight.w500,
                          max: 3)),
                  TextButton.icon(
                      onPressed: null,
                      icon: Icon(
                        Icons.person,
                        color: bl,
                      ),
                      label: alltext(
                          txt: "Posted By :$person",
                          col: bl,
                          siz: 11.sp,
                          wei: FontWeight.w500,
                          max: 3)),
                  Padding(
                    padding: EdgeInsets.only(left: 5.h, top: 5.h),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 7.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.h),
                            color: pp),
                        child: Center(
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: re,
                              ),
                              label: alltext(
                                  txt: "$intrested Proffesionals intrests",
                                  col: wh,
                                  siz: 12.sp,
                                  wei: FontWeight.w600,
                                  max: 3)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
