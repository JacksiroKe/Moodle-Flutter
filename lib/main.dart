import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:moodle_flutter/helpers/app_settings.dart';
import 'package:moodle_flutter/ui/start_screen.dart';
import 'package:moodle_flutter/utils/themes.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatefulWidget {
  const MyApplication({Key key}) : super(key: key);

  @override
  _MyApplicationState createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {
  Future<SharedPreferences> _initAppFuture;

  @override
  void initState() {
    super.initState();
    Future<SharedPreferences> initApp() async {
      return await SharedPreferences.getInstance();
    }

    this._initAppFuture = initApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: this._initAppFuture,
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (!snapshot.hasData) {
          return _MySplashScreen();
        }
        return ChangeNotifierProvider<AppSettings>.value(
          value: AppSettings(snapshot.data),
          child: _MyApplication(),
        );
      },
    );
  }
}

class _MySplashScreen extends StatelessWidget {
  const _MySplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.white,
      child: Center(
        child: Image.asset('assets/images/appicon.png', height: 300.0, width: 300.0)
      ),
    );
  }
}

class _MyApplication extends StatelessWidget {
  const _MyApplication({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn@Home',
      theme: Provider.of<AppSettings>(context).isDarkMode
          ? asDarkTheme
          : asLightTheme,
      home: new StartScreen(),
    );
  }
}
