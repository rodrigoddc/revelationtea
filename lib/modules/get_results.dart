import 'package:cloud_firestore/cloud_firestore.dart';

Future<int> getMaleResults() async {
  int maleSize;

  await FirebaseFirestore.instance
      .collection('votes')
      .where('choice_gender', isEqualTo: 'male'.toLowerCase())
      .get()
      .then((value) => maleSize = value.size);

  return maleSize;
}

Future<int> getFemaleResults() async {
  int femaleSize;

  await FirebaseFirestore.instance
      .collection('votes')
      .where('choice_gender', isEqualTo: 'female'.toLowerCase())
      .get()
      .then((value) => femaleSize = value.size);

  return femaleSize;
}
