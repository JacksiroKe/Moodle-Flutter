import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:moodle_flutter/widgets/progress_dialog1.dart';
import 'package:moodle_flutter/helpers/app_futures.dart';
import 'package:moodle_flutter/models/base/EventObject.dart';
import 'package:moodle_flutter/ui/start_screen.dart';
import 'package:moodle_flutter/ui/register_screen.dart';
import 'package:moodle_flutter/utils/app_shared_preferences.dart';
import 'package:moodle_flutter/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final globalKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey();

  ProgressDialog1 progressDialog = ProgressDialog1.getProgressDialog1(ProgressDialogTitles.login_progress_authenticating);

  String userToken = "";
  TextEditingController usernameController = new TextEditingController(text: "");
  TextEditingController passwordController = new TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: globalKey,
        backgroundColor: Colors.white,
        body: new Stack(
          children: <Widget>[
            _loginContainer(), 
            progressDialog
          ],
        ));
  }

  Widget _loginContainer() {
    return new Container(
        child: new ListView(
      children: <Widget>[
        new Center(
          child: new Column(
            children: <Widget>[
              _appIcon(),
              _loginNowLabel(),
              _formContainer(),
              _notRegisterdLabel(),
              _registerNowLabel(),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _appIcon() {
    return new Container(
      child: new Image(
        image: new AssetImage("assets/images/appicon.png"),
        height: 170.0,
        width: 170.0,
      ),
      margin: EdgeInsets.only(top: 20.0),
    );
  }

  Widget _loginNowLabel() {
    return new Padding(
      padding: new EdgeInsets.only(left: 25.0, right: 25.0),
      child: Center(
        child: new Text(
          Texts.PLEASE_LOGIN,
          style: TextStyle(fontSize: 18.0, ),
        ),
      ),
    );
  }

  Widget _formContainer() {
    return new Container(
      child: Column(children: <Widget>[
        FormBuilder(
          key: _formKey,
          child: Column(
            children: <Widget>[
              _usernameContainer(),
              _passwordContainer()],
          ),
        ),
        _loginButtonContainer(),
      ]),
      margin: EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
    );
  }

  Widget _usernameContainer() {
    return new Padding(
      padding: new EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Center(
        child: new FormBuilderTextField(
          attribute: 'username',
          controller: usernameController,
          decoration: InputDecoration(
            labelText: Texts.USERNAME,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            prefixIcon: new Icon(
              Icons.email,
              color: Colors.blue[500],
            ),
          ),
        ),
      ),
    );
  }

  Widget _passwordContainer() {
    return new Padding(
      padding: new EdgeInsets.all(25.0),
      child: Center(
        child: new FormBuilderTextField(
          attribute: 'password',
          controller: passwordController,
          decoration: InputDecoration(
            labelText: Texts.PASSWORD,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
            prefixIcon: new Icon(
              Icons.vpn_key,
              color: Colors.blue[500],
            ),
          ),
          keyboardType: TextInputType.text,
          obscureText: true,
        ),
      ),
    );
  }

  Widget _loginButtonContainer() {
    return new Padding(
      padding: new EdgeInsets.all(25.0),
      child: new Container(
        width: double.infinity,
        decoration: new BoxDecoration(
          color: Colors.blue[500],
          borderRadius: BorderRadius.circular(5.0)
        ),
        child: new MaterialButton(
          textColor: Colors.white,
          padding: EdgeInsets.all(15.0),
          onPressed: _loginButtonAction,
          child: new Text(
            Texts.LOGIN,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        margin: EdgeInsets.only(bottom: 30.0),
      )
    );
  }

  Widget _notRegisterdLabel() {
    return new Container(
      child: new Text(
        Texts.NEW_USER,
        style: TextStyle(fontSize: 25.0),
      ),
    );
  }

  Widget _registerNowLabel() {
    return new GestureDetector(
      onTap: _goToRegisterScreen,
      child: new Container(
        child: new Text(
          Texts.REGISTER_NOW,
          style: TextStyle(fontSize: 25.0, color: Colors.blue[500]),
        ),
        margin: EdgeInsets.only(bottom: 30.0)),
    );
  }

  void _loginButtonAction() {
    if (usernameController.text == "") {
      globalKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_USERNAME),
      ));
      return;
    }

    if (passwordController.text == "") {
      globalKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_PASS),
      ));
      return;
    }
    FocusScope.of(context).requestFocus(new FocusNode());
    progressDialog.showProgress();
    _getUserToken(usernameController.text, passwordController.text);
  }

  void _getUserToken(String username, String password) async {
    EventObject eventObject = await getTokenByLogin(username, password);
    switch (eventObject.id) {
      case EventConstants.LOGIN_USER_SUCCESSFUL:
        {
          setState(() {
            userToken = eventObject.object;
            AppSharedPreferences.setUserToken(userToken);
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.LOGIN_SUCCESSFUL),
            ));
            progressDialog.hideProgress();
            _userDetailsAction();
          });
        }
        break;
      case EventConstants.LOGIN_USER_UN_SUCCESSFUL:
        {
          setState(() {
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.LOGIN_UN_SUCCESSFUL),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
      case EventConstants.NO_INTERNET_CONNECTION:
        {
          setState(() {
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.NO_INTERNET_CONNECTION),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
    }
  }

  void _userDetailsAction() {
    FocusScope.of(context).requestFocus(new FocusNode());
    progressDialog.showProgressWithText(ProgressDialogTitles.login_progress_fetch_detail);
    _getUserDetails();
  }

  void _getUserDetails() async {
    EventObject eventObject = await fetchUserDetail(userToken);
    switch (eventObject.id) {
      case EventConstants.LOGIN_USER_SUCCESSFUL:
        {
          setState(() {
            AppSharedPreferences.setUserLoggedIn(true);
            AppSharedPreferences.setUserProfile(eventObject.object);
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.LOGIN_SUCCESSFUL),
            ));
            progressDialog.hideProgress();
            _goToStartScreen();
          });
        }
        break;
      case EventConstants.LOGIN_USER_UN_SUCCESSFUL:
        {
          setState(() {
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.LOGIN_UN_SUCCESSFUL),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
      case EventConstants.NO_INTERNET_CONNECTION:
        {
          setState(() {
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.NO_INTERNET_CONNECTION),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
    }
  }

  void _goToStartScreen() {
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(builder: (context) => new StartScreen()),
    );
  }

  void _goToRegisterScreen() {
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(builder: (context) => new RegisterScreen()),
    );
  }
}
