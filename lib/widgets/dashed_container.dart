import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class DashedContainer extends StatelessWidget {
  final Widget child;
  const DashedContainer({@required this.child});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.white,
      dashPattern: [10, 5],
      strokeWidth: 3,
      borderType: BorderType.RRect,
      radius: Radius.circular(10),
      child: child,
    );
  }
}
