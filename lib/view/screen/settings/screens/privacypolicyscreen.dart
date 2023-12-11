import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:sizer/sizer.dart';
import 'package:social_syn/view/utility/alltext.dart';
import 'package:social_syn/view/utility/colors.dart';

class privacypolicyscreen extends StatelessWidget {
  const privacypolicyscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: wh,
            )),
        backgroundColor: bl,
        title: alltext(
            txt: "Privacy and policy",
            col: wh,
            siz: 13.sp,
            wei: FontWeight.w400,
            max: null),
      ),
      backgroundColor: bl,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headtitle(txt: "Privacy Policy for Social Sync App"),
              siz(hei: 2.h),
              subtitle(txt: "Last updated: 1/01/2024"),
              siz(hei: 1.h),
              subtitle(
                  txt:
                      "Welcome to Social Sync! This Privacy Policy is designed to help you understand how your personal information is collected, used, and shared when you use our Social Sync mobile application (the).By downloading, installing, or using the App, you agree to the terms outlined in this Privacy Policy. If you do not agree with the terms, please do not use the App."),
              siz(hei: 1.h),
              headtitle(txt: "1.1 Information You Provide:"),
              siz(hei: 1.h),
              subtitle(
                  txt:
                      "When you create an account, we collect your username, email address, and password.If you choose to connect Social Sync with your social media accounts, we may collect information from those accounts, such as your profile picture, friends list, and other publicly available information"),
              siz2(),
              headtitle(txt: "1.2 Automatically Collected Information:"),
              siz2(),
              subtitle(
                  txt:
                      "We may collect information about your device, including the type of device, operating system, and device identifiers.We collect information about how you use the App, such as the features you use, the content you view, and the actions you take."),
              siz2(),
              headtitle(txt: "2.1 Provide and Improve the App:"),
              siz2(),
              subtitle(
                  txt:
                      "We use your information to provide and maintain the App, including user authentication, personalized content, and feature improvements."),
              siz2(),
              headtitle(txt: "2.2 Communicate With You:"),
              subtitle(
                  txt:
                      "We may use your email address to send you updates, newsletters, and promotional materials. You can opt-out of these communications at any time."),
              siz2(),
              headtitle(txt: "3.1 Third-Party Service Providers:"),
              subtitle(
                  txt:
                      "We may share your information with third-party service providers to perform tasks on our behalf, such as hosting, analytics, and customer support.3.2 Legal Compliance:\n\nWe may disclose your information if required by law or in response to valid legal requests.\n3.3 Business Transfers:\nIn the event of a merger, acquisition, or sale of all or part of our assets, your information may be transferred as part of the transaction."),
              siz2(),
              headtitle(txt: "4.1 Account Information:"),
              siz2(),
              subtitle(
                  txt:
                      "You can review and update your account information at any time by accessing your account settings in the App.\n4.2 Communication Preferences:\nYou can opt-out of receiving promotional emails by following the instructions in the emails or contacting us directly.."),
              siz2(),
              headtitle(txt: "5. Security"),
              siz2(),
              subtitle(
                  txt:
                      "YWe take reasonable measures to protect your information, but no method of transmission over the internet or electronic storage is completely secure. Therefore, we cannot guarantee absolute security."),
              siz2(),
              headtitle(txt: "6. Changes to this Privacy Policy"),
              siz2(),
              subtitle(
                  txt:
                      "We may update this Privacy Policy from time to time. The date of the latest revision will be indicated at the top of the policy. Your continued use of the App after any changes to this Privacy Policy constitutes acceptance of the updated terms."),
              siz2(),
              siz2(),
              headtitle(txt: "7. Contact Us"),
              siz2(),
      
              subtitle(
                  txt:
                      "If you have any questions or concerns about this Privacy Policy,\n please contact us at midhunpu80@gmail.com."),
                              siz(hei: 3.h),
                      headtitle(txt: "Thank you for using Social Sync!"),
            ],
          ),
        ),
      ),
    );
  }
}

siz({required double hei}) {
  return SizedBox(
    height: hei,
  );
}

siz2() {
  return SizedBox(
    height: 1.h,
  );
}

headtitle({required var txt}) {
  return Container(
    child:
        alltext(txt: txt, col: wh, siz: 12.sp, wei: FontWeight.bold, max: null),
  );
}

subtitle({required var txt}) {
  return Container(
    child:
        alltext(txt: txt, col: wh, siz: 10.sp, wei: FontWeight.w400, max: null),
  );
}
