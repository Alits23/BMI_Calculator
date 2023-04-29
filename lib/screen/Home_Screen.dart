import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../widgets/left_shape.dart';
import '../widgets/right_shape.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final weightcontroller = TextEditingController();
  final heightcontroller = TextEditingController();
  double bmiResult = 0;
  String textresult = '';
  double negative = 100;
  double positive = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  'your BMI ?',
                  style: TextStyle(
                    color: amber,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //text field
                      Container(
                        width: 150,
                        child: TextField(
                          controller: weightcontroller,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Weight(kg)',
                            hintStyle: TextStyle(
                              color: Red.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                      //text field

                      Container(
                        width: 150,
                        child: TextField(
                          controller: heightcontroller,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'height(m)',
                            hintStyle: TextStyle(
                              color: Red.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.grey.withOpacity(0.3),
                    ),
                    onPressed: () {
                      final weight = double.parse(weightcontroller.text);
                      final height = double.parse(heightcontroller.text);

                      setState(
                        () {
                          bmiResult = weight / (height * height);
                          if (bmiResult > 25) {
                            negative = 270;
                            positive = 50;
                            textresult = 'You are overweight';
                          } else if (bmiResult <= 25 && bmiResult > 18.5) {
                            negative = 50;
                            positive = 270;
                            textresult = 'Your weight is normal';
                          } else {
                            negative = 20;
                            positive = 20;
                            textresult = 'Your weight is less than normal';
                          }
                        },
                      );
                    },
                    child: Text(
                      'calculat !',
                      style: TextStyle(
                        fontSize: 40,
                        color: amber,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  '${bmiResult.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 100,
                  child: Divider(
                    thickness: 4,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  '<< $textresult >>',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RightShape(width: negative),
                LeftShape(width: positive),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
