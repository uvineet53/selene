import 'package:flutter/material.dart';

class Matching extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff193B4E),
      body: Center(
          child: Hero(
        tag: 'match',
        child: Text(
          "MATCH",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 48),
        ),
      )),
    );
  }
}
