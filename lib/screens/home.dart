import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revelationtea/modules/get_results.dart';
import 'package:revelationtea/modules/sigin_in_google.dart';
import 'package:revelationtea/modules/vote.dart';
import 'package:revelationtea/screens/results.dart';
import 'package:revelationtea/widgets/bottom_button.dart';
import 'package:revelationtea/widgets/gender_box.dart';

class Home extends StatefulWidget {
  final User user;
  Home({this.user});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String choicedGender;

  bool choicedBool;

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
                      fontSize: 30,
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
                    color: choicedGender == 'male'
                        ? Colors.lightBlue
                        : Colors.white,
                    onPressed: () {
                      setState(() {
                        choicedGender = 'male';
                        choicedBool = false;
                      });
                    },
                  ),
                  GenderBox(
                    gender: 'Menina',
                    imageBackground: 'assets/img/g.png',
                    color: choicedGender == 'female'
                        ? Colors.purpleAccent
                        : Colors.white,
                    onPressed: () {
                      setState(() {
                        choicedGender = 'female';
                        choicedBool = false;
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
                          choicedBool: choicedBool,
                          choicedGender: choicedGender,
                          icon: Icon(
                            Icons.insert_chart,
                            color: Colors.brown,
                            size: 28,
                          ),
                          color: Colors.brown,
                        ),
                        BottomButton(
                          onPressed: () {
                            vote(
                                userEmail: 'b',
                                choiceBool: choicedBool,
                                choiceGender: choicedGender);
                          },
                          label: 'Votar!',
                          choicedBool: choicedBool,
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
                        onPressed: () {},
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
