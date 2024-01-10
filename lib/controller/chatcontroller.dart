import 'package:get/get.dart';
import 'package:social_syn/view/service/chat/chat.dart';
import 'package:social_syn/view/utility/colors.dart';

class chatcontroller extends GetxController {
  chatservice _chat = chatservice();

  sendchat({
    required var uid,
    required var text,
    required var name,
    required var profile,
  }) async {
    try {
      String res = await _chat.addmessege(
          uid: uid, text: text, name: name, profile: profile);
      if (res == "sucess") {
      
      } else {
      }
    } catch (e) {
    }
  }
}
