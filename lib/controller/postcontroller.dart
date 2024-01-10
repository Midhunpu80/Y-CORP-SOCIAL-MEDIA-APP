import 'dart:typed_data';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_syn/view/service/posts/posts.service.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/utility/snackbar.dart';

class postcontroller extends GetxController {
  var isloading = false.obs;

  final createpost_service _post = createpost_service();

  postdelete({required var id, required BuildContext context}) async {
    try {
      String resp = await _post.deletepost(id: id);
      if (resp == "success") {
        customsnackbar(
            titile: "sucess",
            messege: "postdeleted succesfully",
            type: ContentType.success);
      } else {}
    } catch (e) {
      customsnackbar(
          titile: "failed",
          messege: "postdeleted falied",
          type: ContentType.failure);
    }
  }

  postthepost(
      {required BuildContext context,
      required Uint8List file,
      required var uid,
      required var profile,
      required var username,
      required var captions}) async {
    try {
      isloading(true);

      String res = await _post.createpost(
          file: file,
          uid: uid,
          captions: captions,
          profile: profile,
          username: username);
      if (res == "sucess") {
        isloading(false);

        ///Get.snackbar("sucess","sucess");
        customsnackbar(
            titile: "sucess",
            messege: "postuploaded succesfully",
            type: ContentType.success);
        update();
      } else {
        isloading(false);
       await customsnackbar(
            titile: "failed",
            messege: "post upload falied",
            type: ContentType.failure);

        update();
      }
    } catch (e) {
    await  customsnackbar(
          titile: "failed",
          messege: "post upload falied$e",
          type: ContentType.failure);
      isloading(false);
    }
  }

  postcomment(
      {required var uid,
      required var profile,
      required var name,
      required var postid,
      required var text,
      required BuildContext context}) async {
    try {
      isloading(true);

      String res = await _post.postcomments(
          postid: postid, text: text, name: name, profile: profile, uid: uid);

      if (res == "sucess") {
        // ignore: use_build_context_synchronously
        customsnackbar(
            titile: "Sucess",
            messege: "posted the comment ",
            type: ContentType.success,
            context: context);
        isloading(false);
        update();
      } else {
        Get.snackbar("failed", "uploaded failed");
        isloading(false);
        update();
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
      isloading(false);
    }
  }

  deltethecomment({required var postid, required var commentid}) async {
    try {
      String res =
          await _post.deltecomment(postid: postid, commentid: commentid);
      if (res == "sucess") {
        Get.snackbar("sucess", "deleted", backgroundColor: wh);
      } else {
        Get.snackbar("failed", "failed", backgroundColor: wh);
      }
    } catch (e) {
      Get.snackbar("failed", e.toString(), backgroundColor: wh);
    }
  }
}
