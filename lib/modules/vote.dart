import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

// ignore: missing_return
Future<String> vote(
    {@required String userEmail, bool choiceBool, String choiceGender}) async {
  var resp;

  if (userEmail != '') {
    final _firestore = FirebaseFirestore.instance;

    var testDocs = FirebaseFirestore.instance
        .collection('votes')
        .where('user_email', isEqualTo: userEmail.toLowerCase())
        .limit(1);

    if (testDocs.snapshots().contains('$userEmail') != null) {
      //already vote
      resp = 'Você já votou espertão! Não pode fraldar a torcida! =P';
      print(resp);
      return resp;
    } else {
      if (choiceGender == null) {
        resp = 'Selecione um sexo';
        print(resp);
        return resp;
      } else {
        // new vote
        _firestore.collection('votes').add({
          'user_email': userEmail,
          'choice_bool': choiceBool,
          'choice_gender': choiceGender,
          'created_at': DateTime.now(),
        });

        resp = '$userEmail voted on $choiceGender!';

        print('$userEmail voted on $choiceGender!');

        return resp;
      }
    }
  } else {
    var resp = 'Email null';
    return resp;
  }
}
