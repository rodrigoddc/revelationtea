import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

void urlYoutube() async {
  String linkLive = 'link_live';
  await FirebaseFirestore.instance
      .collection('votes')
      .where('user_email', isEqualTo: linkLive.toLowerCase())
      .limit(1)
      .get()
      .then(
    (value) {
      launchYoutubeURL(value.docs[0].data()['choice_gender']);
    },
  );
}

void launchYoutubeURL(String linkLive) async {
  String url = '$linkLive';

  if (Platform.isIOS) {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false);
    } else {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  } else {
    if (await canLaunch(url)) {
      await launch(url);
      print(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
