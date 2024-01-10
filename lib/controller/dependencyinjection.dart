import 'package:get/get.dart';
import 'package:social_syn/controller/Networkconnectivivty.dart';

class dependencyinjection {
  static init() {
    Get.put<network_controller>(network_controller(), permanent: true);
  }
}
