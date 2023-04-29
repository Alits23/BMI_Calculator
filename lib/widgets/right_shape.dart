import 'package:bmi/constants/constants.dart';
import 'package:flutter/material.dart';

class RightShape extends StatelessWidget {
  const RightShape({super.key, this.width = 0});
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'negative',
          style: TextStyle(color: Red),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          width: width,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
            ),
            color: Red,
          ),
        ),
        SizedBox(
          height: 60.0,
        ),
      ],
    );
  }
}
