import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:selene/services/landing_page.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  Future<void> loading() async {
    await Future.delayed(Duration(milliseconds: 1700));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => LandingPage(),
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRipple(
          color: Colors.black,
          size: 150,
        ),
      ),
    );
  }
}
