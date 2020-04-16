import 'package:flutter/material.dart';
import 'package:soundvision/data/shared/sharedPreferencesData.dart';

class POPPlan extends StatefulWidget {
  @override
  _POPPlanState createState() => _POPPlanState();
}

class _POPPlanState extends State<POPPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
      title: Text("계획 수립"),
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
        body:Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[ Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400], width: 1),
                ),
                child: Table(
                  defaultColumnWidth:FixedColumnWidth(MediaQuery.of(context).size.width * 0.48),
                  children: [
                    TableRow(

                      children: [
                        Container(
                          constraints: BoxConstraints.expand(
                            height: MediaQuery.of(context).size.width * 0.04,

                          ),
                          decoration: new BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey[400]),),
                              color: Colors.grey[200]
                          ),
                          child: Text("계획일자",style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.027),),
                        ),
                        Container(
                          constraints: BoxConstraints.expand(
                            height: MediaQuery.of(context).size.width * 0.04,


                          ),
                          decoration: new BoxDecoration(
                              border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey[400]),),
                              color: Colors.grey[200]
                          ),
                          child: Text("공정",style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.027),),
                        ),
                      ]
                    ),
                    TableRow(
                        children: [
                    Container(
                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                    child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              //padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                              height: 50.0,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey[400],
                                  ),
                                  //borderRadius: BorderRadius.circular(3)
                              ),
                              child:
                              TextFormField(
                                //controller: txtFieldStrDate,
                                textAlignVertical: TextAlignVertical.center,
                                readOnly: true,
                                //onTap: callStrDatePicker,
                                onSaved: (String value) {
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 13.0),
                                  border: InputBorder.none,
                                  icon: new Icon(
                                    Icons.date_range,
                                    size: 30,
                                    color: Colors.grey,
                                  ),
                                ),
                                style: new TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ]
                    )
                    ),
                          Container(child: TextFormField(

                          ),),
                        ]
                    )
                  ],
                ),
              ),
            ),
            ]
          ),
        )
    );
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
