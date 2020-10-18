import 'package:flutter/material.dart';

class ProgressDialog1 extends StatefulWidget {
  Color backgroundColor;
  Color color;
  Color containerColor;
  double borderRadius;
  String text;
  ProgressDialog1State progressDialogState;

  ProgressDialog1(
    {
      this.backgroundColor = Colors.black54,
      this.color = Colors.white,
      this.containerColor = Colors.transparent,
      this.borderRadius = 10,
      this.text
    }
  );

  @override
  createState() => progressDialogState = new ProgressDialog1State(
      backgroundColor: this.backgroundColor,
      color: this.color,
      containerColor: this.containerColor,
      borderRadius: this.borderRadius,
      text: this.text);

  void hideProgress() {
    progressDialogState.hideProgress();
  }

  void showProgress() {
    progressDialogState.showProgress();
  }

  void showProgressWithText(String title) {
    progressDialogState.showProgressWithText(title);
  }

  static Widget getProgressDialog1(String title) {
    return new ProgressDialog1(
      backgroundColor: Colors.black12,
      color: Colors.black,
      containerColor: Colors.white,
      borderRadius: 5,
      text: title,
    );
  }
}

class ProgressDialog1State extends State<ProgressDialog1> {
  Color backgroundColor;
  Color color;
  Color containerColor;
  double borderRadius;
  String text;
  bool _opacity = false;

  ProgressDialog1State(    
    {
      this.backgroundColor = Colors.black54,
      this.color = Colors.white,
      this.containerColor = Colors.transparent,
      this.borderRadius = 10,
      this.text
    }
  );

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: !_opacity ? null : new Opacity(
        opacity: _opacity ? 1 : 0,
        child: new Stack(
          children: <Widget>[
            new Center(
              child: new Container(
                width: 300,
                height: 120,
                decoration: new BoxDecoration(
                  color: containerColor,
                  border: Border.all(color: Colors.blue),
                  boxShadow: [BoxShadow(blurRadius: 5)],
                  borderRadius: new BorderRadius.all(
                     new Radius.circular(borderRadius)
                  )
                ),
              ),
            ),
            new Center(
              child: _getCenterContent(),
            )
          ],
        ),
      )
    );
  }

  Widget _getCenterContent() {
    if (text == null || text.isEmpty) {
      return _getCircularProgress();
    }

    return new Center(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getCircularProgress(),
          new Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: new Text(
              text,
              style: new TextStyle(color: color, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }

  Widget _getCircularProgress() {
    return new CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation(Colors.blue[900]));
  }

  void hideProgress() {
    setState(() {
      _opacity = false;
    });
  }

  void showProgress() {
    setState(() {
      _opacity = true;
    });
  }

  void showProgressWithText(String title) {
    setState(() {
      _opacity = true;
      text = title;
    });
  }
}
