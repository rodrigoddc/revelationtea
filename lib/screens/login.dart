import 'package:flutter/material.dart';
import 'package:revelationtea/widgets/signin_button.dart';

class LoginPage extends StatelessWidget {
  static const String id = 'login_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: Image(
                  image: AssetImage('assets/img/gender_balance.png'),
                ),
              ),
              SizedBox(height: 50),
              SigninButton(),
            ],
          ),
        ),
      ),
    );
  }
}
