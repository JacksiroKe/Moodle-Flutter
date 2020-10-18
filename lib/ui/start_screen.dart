import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moodle_flutter/ui/login_screen.dart';
import 'package:moodle_flutter/utils/navigation.dart';
import 'package:moodle_flutter/utils/app_shared_preferences.dart';

class StartScreen extends StatefulWidget {
  @override
  createState() => new StartScreenState();
}

class StartScreenState extends State<StartScreen> {
  final globalKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    new Future.delayed(const Duration(seconds: 3), _handleTapEvent);
    return new Scaffold(
      key: globalKey,
      body: Container(
        child: Center(
          child: new Image(
            height: 300.0,
            width: 300.0,
            image: new AssetImage("assets/images/appicon.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  void _handleTapEvent() async {
    bool isLoggedIn = await AppSharedPreferences.isUserLoggedIn();
    if (this.mounted) {
      setState(() {
        if (isLoggedIn != null && isLoggedIn) {
          pushHomeScreen(context);
        } else {
          Navigator.pushReplacement(
            context,
            new MaterialPageRoute(builder: (context) => new LoginScreen()),
          );
        }
      });
    }
  }

}
