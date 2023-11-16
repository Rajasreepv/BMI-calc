import 'dart:ffi';

import 'package:bmi/calculatorbrain.dart';
import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(myApp());
}

enum Gender { female, male }

const Color colour1 = Color(0xFF1D1E33);
const Color activecardcolor = Color(0xFF1D1E33);
const Color inactivecardcolor = Color.fromARGB(255, 49, 50, 69);
const Color colour2 = Colors.limeAccent;
const Color selected = Colors.grey;

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: home(),
    );
  }
}

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int _currentAgevalue = 30;
  int _currentWeightvalue = 50;
  int _currentSliderValue = 130;
  Gender? selectedGender;
  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: reusablecard(
                    colour: selectedGender == Gender.female
                        ? activecardcolor
                        : inactivecardcolor,
                    cardWidget: cardicon(
                      iconname: FontAwesomeIcons.venus,
                      label: "Female",
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    }),
              ),
              Expanded(
                  child: reusablecard(
                colour: selectedGender == Gender.male
                    ? activecardcolor
                    : inactivecardcolor,
                cardWidget: cardicon(
                  iconname: FontAwesomeIcons.mars,
                  label: "Male",
                ),
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
              ))
            ],
          )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 200,
                width: 370,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: colour1),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "HEIGHT",
                        style: TextStyle(color: colour2, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        _currentSliderValue.round().toString() + " \u339D ",
                        style: TextStyle(color: colour2, fontSize: 50),
                      ),
                      Slider(
                        activeColor: colour2,
                        value: _currentSliderValue.toDouble(),
                        max: 200,
                        divisions: 200,
                        label: _currentSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue = value.toInt();
                            ;
                          });
                        },
                      ),
                    ]),
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: reusablecard(
                colour: colour1,
                cardWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "WEIGHT",
                      style: TextStyle(
                        color: colour2,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      _currentWeightvalue.round().toString(),
                      style: TextStyle(
                          color: colour2,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color.fromARGB(255, 48, 46, 46),
                            ),
                            child: IconButton(
                              color: colour2,
                              iconSize: 50,
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  _currentWeightvalue += 1;
                                });
                                // ...
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 48, 46, 46),
                            ),
                            child: IconButton(
                              color: colour2,
                              iconSize: 50,
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  _currentWeightvalue -= 1;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                onPress: () {},
              )),
              Expanded(
                  child: reusablecard(
                colour: colour1,
                cardWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "AGE",
                      style: TextStyle(
                        color: colour2,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      _currentAgevalue.round().toString(),
                      style: TextStyle(
                          color: colour2,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color.fromARGB(255, 48, 46, 46),
                            ),
                            child: IconButton(
                              color: colour2,
                              iconSize: 50,
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  _currentAgevalue += 1;
                                });
                                // ...
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color.fromARGB(255, 48, 46, 46),
                            ),
                            child: IconButton(
                              color: colour2,
                              iconSize: 50,
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  _currentAgevalue -= 1;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                onPress: () {},
              ))
            ],
          )),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              width: double.infinity,
              height: 80.0,
              color: Colors.limeAccent,
              child: TextButton(
                  onPressed: () {
                    calculatorBrain cal = new calculatorBrain(
                        height: _currentSliderValue,
                        weight: _currentWeightvalue);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => result(
                                bmires: cal.calculateBmi(),
                                resulttext: cal.getresult(),
                                interpretation: cal.getIntepretation())));
                  },
                  child: const Text(
                    "CALCULATE BMI",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class reusablecard extends StatelessWidget {
  reusablecard({required this.colour, this.cardWidget, this.onPress});
  final Color colour;
  final Widget? cardWidget;
  final Function? onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: onPress != null ? () => onPress!() : null,
        child: Container(
          child: cardWidget,
          height: 200,
          width: 170,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: colour),
        ),
      ),
    );
  }
}

class cardicon extends StatelessWidget {
  cardicon({required this.iconname, required this.label});
  final String label;
  final IconData iconname;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconname,
          size: 80,
          color: colour2,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: TextStyle(color: colour2, fontSize: 25),
        ),
      ],
    );
  }
}
