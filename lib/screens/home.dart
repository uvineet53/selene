import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:selene/designs/about.dart';
import 'package:selene/designs/bottomshades.dart';
import 'package:selene/designs/dpDesign.dart';
import 'package:selene/designs/menubar.dart';
import 'package:selene/designs/textDesign.dart';
import 'package:selene/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool sideBarOpen = false;
  double xOffset = 0;
  void setSidebarState() {
    setState(() {
      xOffset = sideBarOpen ? 300 : 0;
    });
  }

  Future<User> getDp() async {
    final auth = Provider.of<AuthBase>(context, listen: false);
    final user = await auth.currentUser();
    return user;
  }

  String dpUrl = "", firstName = "Vineet", lastname = "Upadhyay", username = "";

  @override
  void initState() {
    getDp().then((value) {
      setState(() {
        dpUrl = value.photoUrl.toString();
        username = value.displayName;
        firstName = username.substring(0, username.indexOf(" "));
        lastname = username.substring(username.indexOf(" "));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00263b),
      body: Stack(
        children: <Widget>[
          Menubar(),
          Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: AnimatedContainer(
                  transform: Matrix4.translationValues(xOffset, 0, 0),
                  duration: Duration(milliseconds: 300),
                  width: double.infinity,
                  child: SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Color(0xff00263b),
                            ),
                            onPressed: () {
                              sideBarOpen = !sideBarOpen;
                              setSidebarState();
                            },
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                dpWidget(dpUrl, 75.0),
                                SizedBox(
                                  height: 10,
                                ),
                                textRich(firstName, lastname, Color(0xff00263b),
                                    Colors.grey, 28),
                                Text(
                                  ",18 ",
                                  style: TextStyle(
                                      color: Color(0xff00263b),
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                AnimContainer(),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Single",
                              style: TextStyle(
                                  color: Color(0xff00263b),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            icon: Icon(
                              Icons.settings,
                              color: Colors.transparent,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(120))),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.fromLTRB(40, 50, 40, 0),
                    child: bottomShades(context)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
