import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:selene/screens/matching.dart';

Widget bottomShades(BuildContext context) {
  return Row(children: <Widget>[
    Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Color(0xff193B4E),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Center(
                  child: AutoSizeText(
                "MATCH",
                minFontSize: 30,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
            )
          ],
        ),
      ),
    ),
    SizedBox(
      width: 15,
    ),
    Expanded(
        flex: 1,
        child: Hero(
          tag: 'match',
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Matching(),
              ));
            },
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xff193B4E),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Center(
                      child: AutoSizeText(
                    "MATCH",
                    minFontSize: 30,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                )
              ],
            ),
          ),
        ))
  ]);
}
