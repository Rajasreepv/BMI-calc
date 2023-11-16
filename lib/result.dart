import 'package:bmi/main.dart';
import 'package:flutter/material.dart';

class result extends StatelessWidget {
  final String bmires;

  final String resulttext;

  final String interpretation;
  result(
      {required this.bmires,
      required this.resulttext,
      required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text("Bmi Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "YOUR RESULT",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )),
          Expanded(
            flex: 5,
            child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  color: colour1,
                  height: 450,
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        resulttext,
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        bmires,
                        style: TextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 30),
                      Text(
                        textAlign: TextAlign.center,
                        interpretation,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )),
          ),
          Container(
            color: colour2,
            height: 80,
            width: double.infinity,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "RECALCULATE",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
