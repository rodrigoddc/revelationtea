import 'package:flutter/material.dart';

class GenderBox extends StatelessWidget {
  final String gender;

  GenderBox({this.gender});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black54,
        ),
        child: Center(
          child: Text(gender),
        ),
      ),
    );
  }
}
