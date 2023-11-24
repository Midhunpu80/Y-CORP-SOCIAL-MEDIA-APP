import 'dart:convert';

import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:social_syn/view/constant/apiconfigraion.dart';
import 'package:social_syn/view/screen/bottomnavigation/bottomnavigation.dart';


class login_service extends GetxController {
  var isLoading = false.obs;
  Apiconfighomeowner s = Apiconfighomeowner();

  login_services({required var email, required var password}) async {
    final bdy = {
      "email": email.toString(),
      "password": password.toString(),
    };
    try {
      isLoading(true);
      final response = await http.post(
          Uri.parse(
               s.login_url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': '*/*',
            'Accept-Encoding': 'gzip, deflate, br',
            'Connection': 'keep-alive'
          },
          body: jsonEncode(bdy));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        Get.to(() => bottomnavscreen());

        print(data.toString());
        isLoading(false);
        update();
      } else {
        isLoading(false);
        print("is failed to login");
      }

      // ignore: empty_catches
    } catch (e) {
      throw ("is failed to login");
    }
  }

 
  }

