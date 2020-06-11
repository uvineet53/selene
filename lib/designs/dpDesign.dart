import 'package:flutter/material.dart';

Widget dpWidget(url, double radius) {
  return url != null
      ? Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xff00263b), width: 5)),
          child: CircleAvatar(
            backgroundColor: Colors.black,
            maxRadius: radius,
            backgroundImage: NetworkImage(
              url = url,
            ),
          ),
        )
      : Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
        );
}
