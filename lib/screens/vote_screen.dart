import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revelationtea/modules/get_results.dart';
import 'package:revelationtea/modules/launch_youtube.dart';
import 'package:revelationtea/modules/sigin_in_google.dart';
import 'package:revelationtea/modules/vote.dart';
import 'package:revelationtea/screens/results.dart';
import 'package:revelationtea/widgets/bottom_button.dart';
import 'package:revelationtea/widgets/gender_box.dart';

class Vote extends StatefulWidget {
  final User user;
  Vote({@required this.user});

  @override
  _VoteState createState() => _VoteState();
}

class _VoteState extends State<Vote> {
  String choicedGender;

  void _showDialog(String resp) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            resp,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'ArchitectsDaughter',
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: FlatButton(
                      onPressed: () {
                        signOutGoogle();
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
//                  Hero(
//                    tag: 'balance',
//                    child: Container(
//                      margin: EdgeInsets.symmetric(horizontal: 10),
//                      child: Image.asset('assets/img/gender_balance.webp'),
//                      height: 40,
//                    ),
//                  ),
                  Text(
                    'Oi ',
                    style: TextStyle(
                      fontFamily: 'Sacramento',
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  Text(
                    '${widget.user.displayName}!',
                    style: TextStyle(
                      fontFamily: 'Sacramento',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 14,
              child: Row(
                children: [
                  GenderBox(
                    gender: 'Menino',
                    imageBackground: 'assets/img/b.png',
                    color: choicedGender == 'menino'
                        ? Colors.lightBlue
                        : Colors.white,
                    onPressed: () {
                      setState(() {
                        choicedGender = 'menino';
                      });
                    },
                  ),
                  GenderBox(
                    gender: 'Menina',
                    imageBackground: 'assets/img/g.png',
                    color: choicedGender == 'menina'
                        ? Colors.purpleAccent
                        : Colors.white,
                    onPressed: () {
                      setState(() {
                        choicedGender = 'menina';
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BottomButton(
                          onPressed: () async {
                            int m = await getMaleResults();
                            int f = await getFemaleResults();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Results(
                                  m: m,
                                  f: f,
                                ),
                              ),
                            );
                          },
                          label: "Resultados",
                          choicedGender: choicedGender,
                          icon: Icon(
                            Icons.insert_chart,
                            color: Colors.brown,
                            size: 28,
                          ),
                          color: Colors.brown,
                        ),
                        BottomButton(
                          onPressed: () async {
                            String resp;
                            await vote(
                                    userEmail: widget.user.email,
                                    userName: widget.user.displayName,
                                    choiceGender: choicedGender)
                                .then((value) => resp = value)
                                .whenComplete(() => _showDialog(resp));
                          },
                          label: 'Votar!',
                          choicedGender: choicedGender,
                          icon: Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                            size: 28,
                          ),
                          color: Colors.green,
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: OutlineButton(
                        borderSide: BorderSide(color: Colors.red, width: 3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.red),
                        ),
                        padding: EdgeInsets.all(10),
                        color: Colors.red,
                        onPressed: () {
                          urlYoutube();
                        },
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Assista ao vivo!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                              Icon(
                                Icons.live_tv,
                                color: Colors.red,
                                size: 35,
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
