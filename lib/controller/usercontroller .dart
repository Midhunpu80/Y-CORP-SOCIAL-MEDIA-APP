

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class usercontroller extends GetxController {
  editdatas({
    var name,
    var lastname,
    var bio,
    var phone,
    var gender,
  }) {
    editname.text = name;
    editbio.text = bio;
    editlast.text = lastname;
    editphone.text = phone;
    genders.text = gender;
    print(editname.toString());
  }

  final editname = TextEditingController();
  final editlast = TextEditingController();
  final editbio = TextEditingController();
  final editphone = TextEditingController();
  final genders = TextEditingController();

  //////////////////image picker ////////////////////////////////////////////
  Rx<Uint8List?> img = Rx<Uint8List?>(null);

  pick() async {
    ///ImagePicker pi = ImagePicker();
   XFile? data =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (data != null) {
      final Uint8List bytes = await data.readAsBytes();
      img.value = bytes;
      update();
    }
    update();
  }

  //  Rx<Uint8List?> imgBytes = Rx<Uint8List?>(null);

  // void pick() {
  //   if (img.value != null) {
  //     File file = File(img.value!.path);
  //     List<int> bytes = file.readAsBytesSync();
  //     imgBytes.value = Uint8List.fromList(bytes);
  //   }
  // }
}
