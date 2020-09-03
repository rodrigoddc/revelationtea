import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revelationtea/modules/sigin_in_google.dart';
import 'package:revelationtea/modules/vote.dart';
import 'package:revelationtea/widgets/bottom_button.dart';
import 'package:revelationtea/widgets/gender_box.dart';

class Home extends StatelessWidget {
  static const String id = 'home';

  User user;
  Home({this.user});

  String choiced_gender;
  bool choiced_bool;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome ${user.displayName}',
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          FlatButton(
                            shape: CircleBorder(
                              side: BorderSide(color: Colors.red),
                            ),
                            padding: EdgeInsets.all(0),
                            onPressed: () {
                              signOutGoogle();
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Follow live: www.somehere;com.br/asdasdfasd',
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    GenderBox(
                      gender: 'Arthur',
                      imageBackground: 'assets/img/boy_glasses.png',
                      onPressed: () {
                        choiced_gender = 'male';
                        choiced_bool = true;
                      },
                    ),
                    GenderBox(
                      gender: 'Luna',
                      imageBackground: 'assets/img/girl_glasses.png',
                      onPressed: () {
                        choiced_gender = 'female';
                        choiced_bool = false;
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BottomButton(
                      onPressed: () {
                        vote(
                            user_email: 'b',
                            choice_bool: choiced_bool,
                            choice_gender: choiced_gender);
                      },
                      label: 'Vote Now!',
                      choiced_bool: choiced_bool,
                      choiced_gender: choiced_gender,
                      icon: Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                      color: Colors.green,
                    ),
                    BottomButton(
                      onPressed: () {},
                      label: "Follow results",
                      choiced_bool: choiced_bool,
                      choiced_gender: choiced_gender,
                      icon: Icon(
                        Icons.search,
                        color: Colors.deepPurple,
                      ),
                      color: Colors.deepPurple,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
