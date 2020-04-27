import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:soundvision/data/shared/sharedPreferencesData.dart';


// AppCertified {App Key 인증}
Future<int> AppCertified(String idx) async {

  String url = 'http://soundvision.smart-tobe.co.kr:19823/mobileKey';
  print(idx);
  final response = await http.post(url,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: jsonEncode({"keyword": idx}));

  if (response.statusCode == 200) {
    print('RETURNING: ' + response.body);


    Message m = Message.fromJSON(jsonDecode(response.body));

    if(m.result == "OK"){
      return int.parse('1') ;
    } else{
      return int.parse('0') ;
    }

  } else {
    return int.parse('0') ;
    throw Exception('Failed to load post');
  }
  //return int.parse('1') ;

}



Future<String> loginHttp(String id,String pw) async {

  String url = 'http://soundvision.smart-tobe.co.kr:19823/mobileLogin';

  final response = await http.post(url,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: jsonEncode({"user_code": id,"user_pwd":pw}));

  if (response.statusCode == 200) {
    print('RETURNING: ' + response.body);

    if(response.body != ''){
      User u = User.fromJSON(jsonDecode(response.body));

      if(u != null){
        setMobileLoginIdPwd(u.user_code, u.user_name);
        return 'OK' ;
      } else{
        return 'NG' ;
      }
    } else {
      return 'NG' ;
    }

  } else {
    return 'NG' ;
    throw Exception('Failed to load post');
  }
}




class Message {
  final String message;
  final String result;

  Message({

    this.message,
    this.result,
  });

  factory Message.fromJSON(Map<String, dynamic> json) {
    return Message(
      result: json['result'],
      message: json['message'],
    );
  }
}


class User {
  final String user_code;
  final String user_name;

  User({

    this.user_code,
    this.user_name,
  });



  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
      user_code: json['user_code'],
      user_name: json['user_name'],
    );
  }
}
