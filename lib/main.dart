import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soundvision/data/shared/sharedPreferencesData.dart';
import 'package:soundvision/screen/TEST/Transitions.dart';
import 'package:soundvision/screen/home/Home.dart';
import 'package:soundvision/screen/key/Key.dart';
import 'package:soundvision/screen/landing/Landing.dart';
import 'package:soundvision/screen/login/Login.dart';
import 'package:flutter/services.dart';


//Future<void> main() async {
//  SharedPreferences prefs = await SharedPreferences.getInstance();
//  var token = prefs.getString('counter');
//  print(token);
//
//  runApp(MaterialApp(home: token == null ? Login() : Home()));
//}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      localizationsDelegates: [ GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, ], supportedLocales: [ const Locale('en', 'US'), const Locale('ko', 'KO'), ],
      debugShowCheckedModeBanner: false,
      title: 'Login Demo',
      routes: {
        '/': (context) => Landing(),
        '/key': (context) => Mobilekey(),
        '/login': (context) => LoginPage(),
        '/home': (context) => Home(),
      },
      theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.black,
          buttonColor: Colors.black,
      ),
    );
  }
}


//class MyApp extends StatefulWidget {
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState  extends State<MyApp> {
//
//
//  // This widget is the root of your application.
//    int check2 = 0;
//  @override
//  Widget build(BuildContext context) {
//
//    chkPrefs().then((bool rs){
//      if(rs == true){
//            check2 = 1;
//
//        } else {
//            check2 = 0;
//
//        }
//
//    print(check2);
//
//    });
//    print("--------------------------");
//    print(check2);
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//
//        primarySwatch: Colors.blue,
//      ),
//      home: check2 == 0 ? Mobilekey() : Home(),
//    );
//
//  }
//
//
//
//
//
//
//
//}
//
//
//class MyHomePage extends StatefulWidget {
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//
//
//
//
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//
//
//  @override
//  Widget build(BuildContext context) {
//      return Container();
//  }
//
//
//}









