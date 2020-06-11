import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selene/screens/home.dart';
import 'package:selene/screens/loader.dart';
import 'package:selene/screens/splashScreen.dart';
import 'package:selene/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.white),
        home: Loader(),
        routes: {
          '/loader': (context) => Loader(),
          '/splash': (context) => SplashScreen(),
          '/home': (context) => Home(),
        },
      ),
    );
  }
}
