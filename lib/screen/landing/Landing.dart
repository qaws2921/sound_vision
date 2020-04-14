import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  String mobilekey = '';
  String login = '';

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  _loadUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.getString('mobilkey') != null) {
      mobilekey = prefs.getString('mobilkey');
      if (mobilekey != 'OK') {
        Navigator.pushNamedAndRemoveUntil(
            context, '/key', ModalRoute.withName('/key'));
      } else {
        if(prefs.getString('login') != null) {
          login = prefs.getString('login');
          if (login != 'OK') {
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', ModalRoute.withName('/login'));
          } else {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', ModalRoute.withName('/home'));
          }
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, '/login', ModalRoute.withName('/login'));
        }
      }
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, '/key', ModalRoute.withName('/key'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}