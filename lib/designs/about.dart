import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AnimContainer extends StatefulWidget {
  @override
  _AnimContainerState createState() => _AnimContainerState();
}

class _AnimContainerState extends State<AnimContainer> {
  double _width = 100.0;
  double _height = 50;
  var txtStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  String _text = "About Me";
  String _description =
      "\"I think the perfection of love is that it's not perfect.\"";
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (_width == 100 && _height == 50 && _text == "About Me") {
            _width = 200;
            _height = 100;
            _text = _description;
          } else {
            _width = 100;
            _height = 50;
            _text = "About Me";
          }
        });
      },
      child: AnimatedContainer(
        padding: EdgeInsets.all(10),
        duration: Duration(milliseconds: 300),
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          color: Color(0xff00263b),
          borderRadius: BorderRadius.circular(25),
        ),
        curve: Curves.fastOutSlowIn,
        child: Center(
            child: AutoSizeText(
          _text,
          style: txtStyle,
          maxFontSize: 30,
          maxLines: 4,
        )),
      ),
    );
  }
}
