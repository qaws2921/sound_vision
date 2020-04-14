import 'package:flutter/material.dart';
import 'package:soundvision/data/shared/sharedPreferencesData.dart';
import 'package:soundvision/http/httpHandler.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String user_code = '';
  String user_pwd = '';


  void showAlertDialog(BuildContext context) async {
    String result = await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('경고창'),
          content: Text("아이디와 비밀번호를 다시 확인 해주세요."),
          actions: <Widget>[
            
            FlatButton(
              child: Text('닫기'),
              onPressed: () {
                Navigator.pop(context, "Cancel");
              },
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 80.0,
        child: Image.asset('assets/logo/logo.png'),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      onSaved: (String value) {
        this.user_code = value;
      },

      decoration: InputDecoration(
        hintText: 'ID',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (value) => value.isEmpty ? '아이디를 입력해주세요.' : null,
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      onSaved: (String value) {
        this.user_pwd = value;
      },
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (value) => value.isEmpty ? '비밀번호를 입력해주세요.' : null,
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          if (this._formKey.currentState.validate()) {
            _formKey.currentState.save();
            loginHttp(user_code,user_pwd).then((result) {
              if (result == 'NG') {
                showAlertDialog(context);
              } else {
                setMobileLogin();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', ModalRoute.withName('/'));
              }
            });
          }
        },
        padding: EdgeInsets.all(12),
        color: Colors.black,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

//    final forgotLabel = FlatButton(
//      child: Text(
//        'Forgot password?',
//        style: TextStyle(color: Colors.black54),
//      ),
//      onPressed: () {},
//    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
           // shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0,top: 150.0),
            children: <Widget>[
              logo,
              SizedBox(height: 48.0),
              email,
              SizedBox(height: 8.0),
              password,
              SizedBox(height: 24.0),
              loginButton

            ],
          ),
        ),
      ),
    );
  }
}
