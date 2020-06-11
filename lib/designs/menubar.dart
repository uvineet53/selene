import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selene/designs/textDesign.dart';
import 'package:selene/screens/splashScreen.dart';
import 'package:selene/services/auth.dart';
import 'package:selene/services/sign_in_methods.dart';

class Menubar extends StatelessWidget {
  List<String> _listItems = [
    "NewsFeed",
    "Chat",
    "Logout",
  ];
  signOutDialog(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return showDialog(
        context: context,
        child: AlertDialog(
          title: Center(
            child: textRich("Sign", "Out", Color(0xff00263b), Colors.grey, 40),
          ),
          content: Text(
            "Are you sure you want to sign out?",
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          actions: <Widget>[
            MaterialButton(
              color: Color(0xff00263b),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              onPressed: () async {
                await signOut(auth);

                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SplashScreen()));
              },
              child: Text(
                "Yes",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: Color(0xff00263b),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "No",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ));
  }

  List<dynamic> _listFunctions = [() {}, () {}, () {}];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: textRich("Menu", "Bar", Colors.white, Colors.grey, 40),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: _listItems.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _listItems[index] == _listItems[_listItems.length - 1]
                              ? signOutDialog(context)
                              : _listFunctions[index];
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: Text(
                            _listItems[index].toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
