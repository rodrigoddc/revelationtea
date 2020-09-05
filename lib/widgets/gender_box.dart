import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenderBox extends StatelessWidget {
  final String gender;
  final String imageBackground;
  final Color color;
  Function onPressed;

  GenderBox({
    @required this.gender,
    @required this.onPressed,
    @required this.imageBackground,
    @required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: onPressed,
        child: Column(
          children: [
            Text(
              gender,
              style: TextStyle(
                fontFamily: 'IndieFlower',
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: color, width: 3),
                  image: DecorationImage(
                    image: AssetImage(imageBackground),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
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
