import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:social_syn/view/service/posts/posts.service.dart';
import 'package:social_syn/view/utility/colors.dart';

class postcontroller extends GetxController {
  var isloading = false.obs;

  createpost_service _post = createpost_service();



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
      Get.snackbar("error", "${e.toString()}");
      isloading(false);
    }
  }

 
}
