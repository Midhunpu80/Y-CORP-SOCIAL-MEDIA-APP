import 'package:get/get.dart';

class bottomcontroller extends GetxController {
  var index = 0.obs;

  changeindex(var val) {
    index.value = val;

  }
}
