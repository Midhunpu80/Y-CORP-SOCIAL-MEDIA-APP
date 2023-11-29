// ignore_for_file: non_constant_identifier_names

import 'package:social_syn/view/constant/constants.dart';

class Apiconfighomeowner {
  final register_url = "${homeownerapi}sendOtp  ";

  // ignore: non_constant_identifier_names
  final login_url = "${homeownerapi}login";
  // ignore: non_constant_identifier_names
  final otpLogin_url = "${homeownerapi}otpLogin";
  final sendotp_url = "${homeownerapi}sendOtp";
  final verifyotp_url = "${homeownerapi}verifyOtp";
  final resetpassword_url = "${homeownerapi}resetPassword";
  final profilepic_url = "${homeownerapi}profilePic";
  final postpic_url = "${homeownerapi}getPost";
  final userdetails_url = "${homeownerapi}userDetails";
  final clientdetails_url = "${homeownerapi}clientDetails";

  final detilsUserprofile_details = "${homeownerapi}detailsUserPro/:userId";

  final like_url = "${homeownerapi}like";

  final comment_url = "${homeownerapi}comment";
  final deletepost_url = "${homeownerapi}deletePost";
  final savepost_url = "${homeownerapi}savePost";
  final getsavedpost_url = "${homeownerapi}getSavedPost/:userId/:type";

  final report_url = "${homeownerapi}report";
  final getpostposted_url = "${homeownerapi}getPostPosted/:userId";
  final getquestions_url = "${homeownerapi}getQuestion";
  final likewuestions_url = "${homeownerapi}likeQuestion";
  final following_url = "${homeownerapi}following";
  final questionComment_url = "${homeownerapi}questionComment";

  final deltequstions_url = "${homeownerapi}deleteQuestion";
  final reuirement_url = "${homeownerapi}requirement";
  final hiredpros_url = "${homeownerapi}hiredPros/:id";
  final hiring_url = "${homeownerapi}hiring";
  final editprofile_url = "${homeownerapi}editProfile";
  final questionUpload_url = "${homeownerapi}quesionUpload";
  final editQuestion_url = "${homeownerapi}editeQuestion";
  final uploadRequirement_url = "${homeownerapi}uploadRequirement";
  final getcategory_url = "${homeownerapi}getCategory";
  final createchat_url = "${homeownerapi}createChat";
  final userchats_url = "${homeownerapi}chat/:userId";
  final findchat_url = "${homeownerapi}find/:firstId/:secondId";
  final getusers_url = "${homeownerapi}user/:id";

  final addmessege_url = "${homeownerapi}addMessage";
  final getmessege_url = "${homeownerapi}message/:chatId";

  final fetchchats_url = "${homeownerapi}FetchChats/:id/:receiverId";
  final fetchnotifications_url = "${homeownerapi}FetchNotification/:id";
  final getrateand_review_url =
      "${homeownerapi}getReteandReview/:proId/:LogedUserId";
  final ratereview_url = "${homeownerapi}RateAndReview";
}
