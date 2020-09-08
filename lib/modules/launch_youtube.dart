import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

Future urlYoutube() async {
  return await FirebaseFirestore.instance
      .collection('votes')
      .where('link_live')
      .limit(1)
      .get();
}

void launchYoutubeURL(String linkLive) async {
  String url = 'https://youtu.be/$linkLive';

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
