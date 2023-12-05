import 'package:get/get.dart';
import 'package:social_syn/view/service/saved/savedservice.dart';
import 'package:social_syn/view/utility/colors.dart';

class postdaved_controller extends GetxController {
  savedpost_servie sv = savedpost_servie();

  savedtheposts(
      {required var photourl,
      required var uid,
      required var postid,
      required var date,
      required var captions,
      required var username,
      required var profile,
      required List comments,
      required List likes}) async {
    try {
      String res = await sv.savethepost(
          photourl: photourl,
          uid: uid,
          postid: postid,
          date: date,
          captions: captions,
          username: username,
          profile: profile,
          comments: comments,
          likes: likes);
      if (res == "sucess") {
        Get.snackbar("sucess", "uploaded succesful", backgroundColor: wh);

        print("sucess");
      } else {
        Get.snackbar("failed", "uploaded failed", backgroundColor: wh);

        print("failed");
      }
    } catch (e) {
      Get.snackbar("sucess", e.toString(), backgroundColor: wh);

      print(e.toString());
    }
  }
}
