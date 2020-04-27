import 'package:flutter/material.dart';
import 'package:soundvision/data/shared/sharedPreferencesData.dart';
import 'package:soundvision/screen/TEST/test.dart';
import 'package:soundvision/screen/popPlan/popPlan.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String check = '실패';



  @override
  void initState() {
    super.initState();
//    setState(() {
//      chkPrefs().then((bool rs) {
//        if (rs == true) {
//          check = '성공';
//        } else {
//          check = '실패';
//        }
//      });
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SOUND VISION"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.power_settings_new),
            tooltip: 'Wow',
            onPressed: () {
              showAlertDialog(context);
            },
          )
        ],
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => POPPlan()));
            },
            child: Container(
              padding: new EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                  ),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: MediaQuery.of(context).size.width*0.08,
                        child: Image.asset('assets/logo/logo.png'),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.05,
                        child: RaisedButton(

                          child: Text("계획수립",
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width*0.04,
                              )),
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.black,
                          disabledTextColor: Colors.white,
                        ),
                      )
                    ],
                  ) ,
                ),

                ],
              ),
            ),
          ),
          Container(
            padding: new EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Test()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                    ),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: MediaQuery.of(context).size.width*0.08,
                          child: Image.asset('assets/logo/logo.png'),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.05,
                          child: RaisedButton(

                            child: Text("생산진행",
                                style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width*0.04,
                                )),
                            color: Colors.black,
                            textColor: Colors.white,
                            disabledColor: Colors.black,
                            disabledTextColor: Colors.white,
                          ),
                        )
                      ],
                    ) ,
                  ),
                ),

              ],
            ),
          ),
          Container(
            padding: new EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                  ),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: MediaQuery.of(context).size.width*0.08,
                        child: Image.asset('assets/logo/logo.png'),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.05,
                        child: RaisedButton(

                          child: Text("생산실적",
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width*0.04,
                              )),
                          color: Colors.black,
                          textColor: Colors.white,
                          disabledColor: Colors.black,
                          disabledTextColor: Colors.white,
                        ),
                      )
                    ],
                  ) ,
                ),

              ],
            ),
          ),
        ],
      )),
    );
    ;
  }

  void showAlertDialog(BuildContext context) async {
    String result = await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('로그아웃'),
          content: Text("로그아웃 하시겠습니까?."),
          actions: <Widget>[
            FlatButton(
              child: Text('확인'),
              onPressed: () {
                Navigator.pop(context, "Cancel");
                setMobileLogout();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', ModalRoute.withName('/'));
              },
            ),
            FlatButton(
              child: Text('취소'),
              onPressed: () {
                Navigator.pop(context, "Cancel");
              },
            ),
          ],
        );
      },
    );
  }
}
