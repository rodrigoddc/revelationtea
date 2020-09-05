import 'package:flutter/material.dart';
import 'package:revelationtea/widgets/signin_button.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 80),
            child: Hero(
              tag: 'balance',
              child: Image(
                image: AssetImage('assets/img/gender_balance.webp'),
              ),
            ),
          ),
          SizedBox(height: 50),
          SigninButton(),
        ],
      ),
    );
  }
}
