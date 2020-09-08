import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:revelationtea/screens/vote_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

Future<User> signInWithGoogle() async {
  await Firebase.initializeApp();

  User user;

  bool isSignedIn = await _googleSignIn.isSignedIn();

  if (isSignedIn) {
    // if so, return the current user
    user = _auth.currentUser;
  } else {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    user = (await FirebaseAuth.instance.signInWithCredential(credential)).user;
  }
  print('Google user ${user.displayName} logged in');
  return user;
}

void signOutGoogle() async {
  await _googleSignIn.signOut();

  print("Google User Sign Out");
}

void onGoogleSignIn(context) async {
  User user = await signInWithGoogle();
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => Vote(user: user)));
}
