import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revelationtea/modules/vote.dart';

class BottomButton extends StatelessWidget {
  final Function onPressed;
  final bool choiced_bool;
  final String choiced_gender;
  final String label;
  final Icon icon;
  final Color color;

  const BottomButton({
    Key key,
    @required this.choiced_bool,
    @required this.choiced_gender,
    @required this.label,
    @required this.icon,
    @required this.color,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color: color),
        ),
        padding: EdgeInsets.all(10),
        color: Colors.white,
        onPressed: onPressed,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                label,
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              icon,
            ],
          ),
        ]),
      ),
    );
  }
}
