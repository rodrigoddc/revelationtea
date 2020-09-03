import 'package:flutter/material.dart';
import 'package:revelationtea/screens/home.dart';
import 'package:revelationtea/screens/login.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Revelation Tea',
      initialRoute: LoginPage.id,
      routes: {
        Home.id: (context) => Home(),
        LoginPage.id: (context) => LoginPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.black,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
