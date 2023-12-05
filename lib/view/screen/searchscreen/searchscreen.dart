// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/main.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

class searchscreen extends StatelessWidget {
  final searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bl,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: wh,
                    )),
                searchfields(controller: searchcontroller),
              ],
            ),
            Obx(
              () {
                if (usercont.serchresult.value.isNotEmpty) {
                  return SizedBox(
                      height: 87.h,
                      width: 100.w,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          ///  final snap = snapshot.data!.docs[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  usercont.serchresult.value[index]['profile']),
                              radius: 5.h,
                            ),
                            title: alltext(
                                txt: usercont.serchresult.value[index]['name'],
                                col: wh,
                                siz: 10.sp,
                                wei: FontWeight.w400,
                                max: 1),
                            subtitle: alltext(
                                txt: "snap['profile']",
                                col: gy,
                                siz: 8.sp,
                                wei: FontWeight.w400,
                                max: 1),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 2.h,
                          );
                        },
                        itemCount: usercont.serchresult.value.length,
                      ));
                } else if (usercont.issearch.value) {
                  return SizedBox(
                    height: 10.h,
                    width: 50.w,
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: SizedBox(
                      height: 10.h,
                      width: 70.w,
                      child: Center(
                        child: alltext(
                            txt: "Search result not found",
                            col: wh.withOpacity(0.3),
                            siz: 14.sp,
                            wei: FontWeight.w400,
                            max: 1),
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

searchfields({required TextEditingController controller}) {
  return SizedBox(
    width: 80.w,
    height: 4.h,
    child: TextFormField(
      onFieldSubmitted: (val) {
        usercont.search(val.toString());
        usercont.issearch(false);
      },
      onChanged: (val) {
        usercont.search(val.toString());
        usercont.issearch(true);
      },
      controller: controller,
      style: TextStyle(
          color: wh.withOpacity(0.8),
          fontSize: 9.sp,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 3),
          hintText: "Serch some one..............",
          hintStyle: TextStyle(
              color: wh, fontSize: 10.sp, fontWeight: FontWeight.w400),
          prefixIcon: Icon(
            Icons.search,
            color: gy,
          ),
          filled: true,
          fillColor: gy.withOpacity(0.2),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(1.h),
              borderSide: BorderSide.none)),
    ),
  );
}
