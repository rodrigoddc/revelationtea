import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

// ignore: missing_return
Future<String> vote(
    {@required String userEmail, String userName, String choiceGender}) async {
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
      resp = 'Você já votou espertão! Não pode "fraldar" a torcida! =P';
      print(resp);
      return resp;
    } else {
      if (choiceGender == null) {
        resp =
            'Ei $userName, selecione o sexo primeiro para poder votar! Dãããr!';
        print(resp);
        return resp;
      } else {
        // new vote
        _firestore.collection('votes').add({
          'user_email': userEmail,
          'user_name': userName,
          'choice_gender': choiceGender,
          'created_at': DateTime.now(),
        });

        if (choiceGender == 'menino') {
          resp = '$userName acha que é $choiceGender ooOoO!';
        } else {
          resp = '$userName acha que é $choiceGender aaAaA!';
        }

        print(resp);

        return resp;
      }
    }
  } else {
    var resp = 'Precisa estar logado!';
    return resp;
  }
}
