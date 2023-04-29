import 'package:bmi/constants/constants.dart';
import 'package:flutter/material.dart';

class LeftShape extends StatelessWidget {
  const LeftShape({super.key, this.width = 0});
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: width,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          'positive',
          style: TextStyle(color: green),
        ),
        SizedBox(
          height: 60.0,
        )
      ],
    );
  }
}
