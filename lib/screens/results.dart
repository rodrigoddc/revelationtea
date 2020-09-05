import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final int m;
  final int f;
  Results({this.m, this.f});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Resultados',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          child: Text(
            'Male: $m',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        Container(
          child: Text(
            'Female: $f',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ],
    );
  }
}
