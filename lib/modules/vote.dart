import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> vote(
    {String user_email, bool choice_bool, String choice_gender}) async {
  bool alreadyVoted = false;

  if (user_email != '') {
    final _firestore = FirebaseFirestore.instance;

    final testDocs = await FirebaseFirestore.instance
        .collection('votes')
        .where('user_email', isEqualTo: user_email.toLowerCase())
        .limit(1)
        .get();

    if (testDocs.docs.length > 0) {
      //already vote
      print('$user_email already voted!');
    } else {
      // new vote
      _firestore.collection('votes').add({
        'user_email': user_email,
        'choice_bool': choice_bool,
        'choice_gender': choice_gender,
        'created_at': DateTime.now(),
      });

      var resp = '$user_email voted on $choice_gender!';

      print('$user_email voted on $choice_gender!');

      return resp;
    }
  } else {
    var resp = 'Email null';
    print('email null');
    return resp;
  }
}
