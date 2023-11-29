import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/likeandcommentbar.dart';

Widget userpostdatasList(BuildContext context) {
  return SliverList.separated(
    itemCount: 5,
    itemBuilder: (context, index) {
      //// final snap = getposts_controll.reply.post[index];
      //  final snap2 = getposts_controll.reply.users[index];
      // final snap3 = getposts_controll.reply.message[index];

      return Card(
        color: bl,
        child: Container(
          height: 76.h,
          decoration: BoxDecoration(
            color: bl,
          ),
          child: Column(
            children: [
              posthead(index: index, type: "".toString(), name: "0"),
              Container(
                color: gr,
                height: 45.h,
                width: 100.w,

                // decoration: BoxDecoration(

                //     image: DecorationImage(
                //         image: NetworkImage(getposts_controll.reply.post[index].image.toString()))),
              ),
              like_and_commentbar(
                context: context,
                ind: index,
                likes: "15",
                commentsa: "",
              ),
              descriptionbar(des: ""),
              Container(
                height: 5.h,
                width: 100.w,
                child: alltext(
                    txt: "   3hours ago",
                    col: wh,
                    siz: 8.sp,
                    wei: FontWeight.bold,
                    max: 1),
              ),
            ],
          ),
        ),
      );
    },
    separatorBuilder: (context, index) {
      return SizedBox();
    },
  );
}

Widget posthead({required var index, required var name, required var type}) {
  return Card(
    color: bl,
    child: Container(
        height: 8.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(1.h), topRight: Radius.circular(1.h)),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: wh,
          ),
          title: alltext(
              txt: "Midhunp",
              col: wh,
              siz: 10.sp,
              wei: FontWeight.w500,
              max: 1),
          trailing: Icon(
            Icons.more_vert_outlined,
            color: wh,
          ),
        )),
  );
}
