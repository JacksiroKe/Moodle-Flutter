import 'package:flutter/material.dart';
import 'package:moodle_flutter/widgets/progress_dialog.dart';
import 'package:moodle_flutter/helpers/app_futures.dart';
import 'package:moodle_flutter/models/base/EventObject.dart';
import 'package:moodle_flutter/ui/login_screen.dart';
import 'package:moodle_flutter/utils/constants.dart';

class RegisterScreen extends StatefulWidget {
  @override
  createState() => new RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final globalKey = new GlobalKey<ScaffoldState>();

  ProgressDialog progressDialog =
      ProgressDialog.getProgressDialog(ProgressDialogTitles.USER_REGISTER);

  TextEditingController nameController = new TextEditingController(text: "");

  TextEditingController emailController = new TextEditingController(text: "");

  TextEditingController passwordController =
      new TextEditingController(text: "");


  bool isValidEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: globalKey,
        backgroundColor: Colors.white,
        body: new Stack(
          children: <Widget>[_loginContainer(), progressDialog],
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
              _formContainer(),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _appIcon() {
    return new Container(
      decoration: new BoxDecoration(color: Colors.blue[900]),
      child: new Image(
        image: new AssetImage("assets/images/appicon.png"),
        height: 170.0,
        width: 170.0,
      ),
      margin: EdgeInsets.only(top: 20.0),
    );
  }

  Widget _formContainer() {
    return new Container(
      child: new Form(
          child: new Theme(
              data: new ThemeData(primarySwatch: Colors.pink),
              child: new Column(
                children: <Widget>[
                  _nameContainer(),
                  _emailContainer(),
                  _passwordContainer(),
                  _registerButtonContainer(),
                  _loginNowLabel(),
                ],
              ))),
      margin: EdgeInsets.only(top: 20.0, left: 25.0, right: 25.0),
    );
  }

  Widget _nameContainer() {
    return new Container(
        child: new TextFormField(
            controller: nameController,
            decoration: InputDecoration(
                suffixIcon: new Icon(
                  Icons.face,
                  color: Colors.pink,
                ),
                labelText: Texts.NAME,
                labelStyle: TextStyle(fontSize: 18.0)),
            keyboardType: TextInputType.text),
        margin: EdgeInsets.only(bottom: 5.0));
  }

  Widget _emailContainer() {
    return new Container(
        child: new TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                suffixIcon: new Icon(
                  Icons.email,
                  color: Colors.pink,
                ),
                labelText: Texts.EMAIL,
                labelStyle: TextStyle(fontSize: 18.0)),
            keyboardType: TextInputType.emailAddress),
        margin: EdgeInsets.only(bottom: 20.0));
  }

  Widget _passwordContainer() {
    return new Container(
        child: new TextFormField(
          controller: passwordController,
          decoration: InputDecoration(
              suffixIcon: new Icon(
                Icons.vpn_key,
                color: Colors.pink,
              ),
              labelText: Texts.PASSWORD,
              labelStyle: TextStyle(fontSize: 18.0)),
          keyboardType: TextInputType.text,
          obscureText: true,
        ),
        margin: EdgeInsets.only(bottom: 35.0));
  }

  Widget _registerButtonContainer() {
    return new Container(
        width: double.infinity,
        decoration: new BoxDecoration(color: Colors.blue[900]),
        child: new MaterialButton(
          textColor: Colors.white,
          padding: EdgeInsets.all(15.0),
          onPressed: _registerButtonAction,
          child: new Text(
            Texts.REGISTER,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
        margin: EdgeInsets.only(bottom: 30.0));
  }

  Widget _loginNowLabel() {
    return new GestureDetector(
      onTap: _goToLoginScreen,
      child: new Container(
          child: new Text(
            Texts.LOGIN_NOW,
            style: TextStyle(fontSize: 18.0, color: Colors.pink),
          ),
          margin: EdgeInsets.only(bottom: 30.0)),
    );
  }

  void _registerButtonAction() {
    if (nameController.text == "") {
      globalKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_NAME),
      ));
      return;
    }

    if (emailController.text == "") {
      globalKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_EMAIL),
      ));
      return;
    }

    if (!isValidEmail(emailController.text)) {
      globalKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_VALID_MAIL),
      ));
      return;
    }

    if (emailController.text == "") {
      globalKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_EMAIL),
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
    _registerUser(
        nameController.text, emailController.text, passwordController.text);
  }

  void _registerUser(String name, String emailId, String password) async {
    EventObject eventObject = await registerUser(name, emailId, password);
    switch (eventObject.id) {
      case EventConstants.USER_REGISTRATION_SUCCESSFUL:
        {
          setState(() {
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.REGISTER_SUCCESSFUL),
            ));
            progressDialog.hideProgress();
            _goToLoginScreen();
          });
        }
        break;
      case EventConstants.USER_ALREADY_REGISTERED:
        {
          setState(() {
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.USER_ALREADY_REGISTERED),
            ));
            progressDialog.hideProgress();
          });
        }
        break;
      case EventConstants.USER_REGISTRATION_UN_SUCCESSFUL:
        {
          setState(() {
            globalKey.currentState.showSnackBar(new SnackBar(
              content: new Text(SnackBarText.REGISTER_UN_SUCCESSFUL),
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


  void _goToLoginScreen() {
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(builder: (context) => new LoginScreen()),
    );
  }
}
