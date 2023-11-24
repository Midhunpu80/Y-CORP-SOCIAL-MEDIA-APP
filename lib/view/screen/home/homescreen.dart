import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/colors.dart';
import 'package:social_syn/view/widgets/drawer.dart';
import 'package:social_syn/view/widgets/storiesbar.dart';
import 'package:social_syn/view/widgets/userpostdetails.dart';

class homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: bl,
        body: CustomScrollView(
          slivers: [
            drawwer(),
            storiesbar(),
            userpostdatasList(context),
          ],
        ));
  }
}
