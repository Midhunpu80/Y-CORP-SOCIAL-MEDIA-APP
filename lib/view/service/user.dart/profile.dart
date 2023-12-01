import 'dart:typed_data';

import 'package:social_syn/main.dart';
import 'package:social_syn/view/utility/firebasecollection/firebasecollection.dart';

class profile_service {
  editprofile(
      {required var id,
      required var name,
      required var lastname,
      required var gender,
      required var phone,
      required var bio,
      required Uint8List profile}) async {
    String photourl =
        await storagecont.uploadimagefirebase("profilepics", profile, false);

    var data = {
      "name": name,
      "last name": lastname,
      "gender": gender,
      "phone": phone,
      "bio": bio,
      "profile": photourl.toString()
    };
    firebasecollections.UserdataList.doc(id).update(data);
  }
}
