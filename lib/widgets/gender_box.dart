import 'package:flutter/material.dart';

class GenderBox extends StatelessWidget {
  final String gender;
  final String imageBackground;
  Function onPressed;

  GenderBox(
      {@required this.gender,
      @required this.onPressed,
      @required this.imageBackground});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: FlatButton(
        onPressed: onPressed,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(imageBackground)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(gender),
        ),
      ),
    );
  }
}
