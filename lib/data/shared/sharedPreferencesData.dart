import 'package:shared_preferences/shared_preferences.dart';


Future<bool> chkPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getInt('counter') == null){
      prefs.setInt('counter', 0);
      return false;
    } else {
      if (prefs.getInt('counter') > 0) {
        return true;
      } else {
        return false;
      }
    }
}


Future<bool> mobilkeyCheck() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if(prefs.getString('mobilkey') == null){
    prefs.setString('mobilkey', '');
    return false;
  } else {
    if (prefs.getString('mobilkey') != 'OK') {
      return true;
    } else {
      return false;
    }
  }
}


Future<bool> loginCheck() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if(prefs.getString('login') == null){
    prefs.setString('login', '');
    return false;
  } else {
    if (prefs.getString('login') == 'OK') {
      return true;
    } else {
      return false;
    }
  }
}


void setPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('mobilkey', 'OK');
}

void setMobileLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('login', 'OK');
}

void setMobileLogout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('login', '');
  prefs.setString('user_code', '');
  prefs.setString('user_name', '');
}

void setMobileLoginIdPwd(String user_code,String user_name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('user_code', user_code);
  prefs.setString('user_name', user_name);
}

