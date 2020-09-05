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
  User user;
  Home({this.user});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String choiced_gender;

  bool choiced_bool;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.all(5),
                child: Row(
                  children: [
                    FlatButton(
                      shape: CircleBorder(
                        side: BorderSide(color: Colors.white),
                      ),
                      onPressed: () {
                        signOutGoogle();
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                    Hero(
                      tag: 'balance',
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset('assets/img/gender_balance.webp'),
                        height: 40,
                      ),
                    ),
                    Text(
                      'Oi ${widget.user.displayName}!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white60, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(
                            Icons.cloud,
                            size: 20,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        Text(
                          'Chuva de amor!',
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontFamily: 'Gaegu',
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(
                            Icons.calendar_today,
                            size: 20,
                            color: Colors.orangeAccent,
                          ),
                        ),
                        Text(
                          '19/09/2020',
                          style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(
                            Icons.timer,
                            size: 20,
                            color: Colors.orangeAccent,
                          ),
                        ),
                        Text(
                          '16h00',
                          style: TextStyle(
                            color: Colors.orangeAccent,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(
                            Icons.location_on,
                            size: 20,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          'Rua: Ataulfo Alves, 157 - Itaquá',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '*sugestão: fraldas P ou M',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'IndieFlower',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  GenderBox(
                    gender: 'Menino',
                    imageBackground: 'assets/img/b.png',
                    color: choiced_gender == 'male'
                        ? Colors.white
                        : Colors.lightBlue,
                    onPressed: () {
                      setState(() {
                        choiced_gender = 'male';
                        choiced_bool = false;
                      });
                    },
                  ),
                  GenderBox(
                    gender: 'Menina',
                    imageBackground: 'assets/img/g.png',
                    color: choiced_gender == 'female'
                        ? Colors.white
                        : Colors.purpleAccent,
                    onPressed: () {
                      setState(() {
                        choiced_gender = 'female';
                        choiced_bool = false;
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
                          choiced_bool: choiced_bool,
                          choiced_gender: choiced_gender,
                          icon: Icon(
                            Icons.insert_chart,
                            color: Colors.white,
                            size: 28,
                          ),
                          color: Colors.deepPurple,
                        ),
                        BottomButton(
                          onPressed: () {
                            vote(
                                user_email: 'b',
                                choice_bool: choiced_bool,
                                choice_gender: choiced_gender);
                          },
                          label: 'Vote agora!',
                          choiced_bool: choiced_bool,
                          choiced_gender: choiced_gender,
                          icon: Icon(
                            Icons.check_circle_outline,
                            color: Colors.white,
                            size: 28,
                          ),
                          color: Colors.green,
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: RaisedButton(
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
                                color: Colors.white,
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
