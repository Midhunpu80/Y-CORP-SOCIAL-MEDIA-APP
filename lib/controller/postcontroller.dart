import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:social_syn/view/service/posts/posts.service.dart';
import 'package:social_syn/view/utility/colors.dart';

class postcontroller extends GetxController {
  var isloading = false.obs;

  final createpost_service _post = createpost_service();

  postdelete({required var id}) async {
    try {
      String resp = await _post.deletepost(id: id);
      if (resp == "success") {
        Get.snackbar("sucess", "Post deleted", backgroundColor: wh);
      } else {
        Get.snackbar("failed", "failed delteting", backgroundColor: wh);
      }
    } catch (e) {
      Get.snackbar("failed", "failed delteting", backgroundColor: wh);
    }
  }

  postthepost(
      {required Uint8List file,
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
        Get.snackbar("sucess", "uploaded succesful", backgroundColor: wh);
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

  postcomment(
      {required var uid,
      required var profile,
      required var name,
      required var postid,
      required var text}) async {
    try {
      isloading(true);

      String res = await _post.postcomments(
          postid: postid, text: text, name: name, profile: profile, uid: uid);

      if (res == "sucess") {
        Get.snackbar("sucess", "uploaded succesful", backgroundColor: wh);
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
