import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selene/designs/textDesign.dart';
import 'package:selene/screens/home.dart';
import 'package:selene/services/auth.dart';
import 'package:selene/services/sign_in_methods.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    final auth = Provider.of<AuthBase>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Align(
              alignment: Alignment.topCenter,
              child: textRich("Sel", 'ene', Colors.black, Colors.blueGrey, 48)),
          Align(
              alignment: Alignment.center,
              child: Image.asset(
                "images/2.png",
                width: _width * .7,
              )),
          Text(
            "With You, Always!",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                fontFamily: "Sans serif"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2)),
                  child: MaterialButton(
                    child: Image.asset(
                      "images/g.png",
                      fit: BoxFit.cover,
                      height: 40,
                    ),
                    onPressed: () async {
                      await signInWIthGoogle(auth);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Home(),
                      ));
                    },
                  )),
              Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      border: Border.all(color: Colors.black, width: 2)),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/home');
                    },
                  )),
              SizedBox(
                width: 20,
              ),
              Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 2)),
                  child: IconButton(
                    icon: Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/home');
                    },
                  )),
              SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      )),
    );
  }
}
