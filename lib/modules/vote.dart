import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

// ignore: missing_return
Future<String> vote({@required String userEmail, String choiceGender}) async {
  var resp;

  if (userEmail != '') {
    final _firestore = FirebaseFirestore.instance;

    var testDocs = await FirebaseFirestore.instance
        .collection('votes')
        .where('user_email', isEqualTo: userEmail.toLowerCase())
        .limit(1)
        .get();

    if (testDocs.docs.length > 0) {
      //already vote
      resp = "Você já votou espertão! Não pode 'fraldar' a torcida! =P";
      print(resp);
      return resp;
    } else {
      if (choiceGender == null) {
        resp = 'Selecione o sexo para poder votar! Dãr!';
        print(resp);
        return resp;
      } else {
        // new vote
        _firestore.collection('votes').add({
          'user_email': userEmail,
          'choice_gender': choiceGender,
          'created_at': DateTime.now(),
        });

        resp = '$userEmail votou: $choiceGender!';

        print('$userEmail votou: $choiceGender!');

        return resp;
      }
    }
  } else {
    var resp = 'Precisa estar logado!';
    return resp;
  }
}
