import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: missing_return
Future<String> vote(
    // ignore: non_constant_identifier_names
    {String userEmail,
    bool choiceBool,
    String choiceGender}) async {
  if (userEmail != '') {
    final _firestore = FirebaseFirestore.instance;

    final testDocs = await FirebaseFirestore.instance
        .collection('votes')
        .where('user_email', isEqualTo: userEmail.toLowerCase())
        .limit(1)
        .get();

    if (testDocs.docs.length > 0) {
      //already vote
      print('$userEmail already voted!');
    } else {
      // new vote
      _firestore.collection('votes').add({
        'user_email': userEmail,
        'choice_bool': choiceBool,
        'choice_gender': choiceGender,
        'created_at': DateTime.now(),
      });

      var resp = '$userEmail voted on $choiceGender!';

      print('$userEmail voted on $choiceGender!');

      return resp;
    }
  } else {
    var resp = 'Email null';
    return resp;
  }
}
