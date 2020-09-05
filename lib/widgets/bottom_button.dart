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
    this.choiced_bool,
    this.choiced_gender,
    @required this.label,
    this.icon,
    @required this.color,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 50,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color: color),
        ),
        color: color,
        onPressed: onPressed,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      label,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  icon,
                ],
              ),
            ]),
      ),
    );
  }
}
