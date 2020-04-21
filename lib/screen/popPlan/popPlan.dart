import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soundvision/data/shared/sharedPreferencesData.dart';
import 'package:english_words/english_words.dart';
import 'package:soundvision/screen/image/image1.dart';

class POPPlan extends StatefulWidget {
  @override
  _POPPlanState createState() => _POPPlanState();
}

class _POPPlanState extends State<POPPlan> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _headerTitle() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.96,
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.015),
                  width: MediaQuery.of(context).size.width * 0.16,
                  child: Text(
                    "계획일자",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.016),
                  )),
              Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.015),
                  width: MediaQuery.of(context).size.width * 0.17,
                  child: Text("공정",
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.height * 0.016))),
              Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.015),
                  width: MediaQuery.of(context).size.width * 0.52,
                  child: Text("현장명",
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.height * 0.016))),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.015),
                  width: MediaQuery.of(context).size.width * 0.16,
                  child: Text("계획번호",
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.height * 0.016))),
              Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.015),
                  width: MediaQuery.of(context).size.width * 0.17,
                  child: Text("제품구분",
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.height * 0.016))),
              Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.015),
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: Text("제품명",
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.height * 0.016))),
              Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.015),
                  width: MediaQuery.of(context).size.width * 0.22,
                  child: Text("시작시간",
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.height * 0.016))),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.015),
                  width: MediaQuery.of(context).size.width * 0.16,
                  child: Text("")),
              Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.015),
                  width: MediaQuery.of(context).size.width * 0.17,
                  child: Text("계획명",
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.height * 0.016))),
              Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.015),
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: Text("")),
              Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.015),
                  width: MediaQuery.of(context).size.width * 0.22,
                  child: Text("종료시간",
                      style: TextStyle(
                          fontSize:
                              MediaQuery.of(context).size.height * 0.016))),
            ],
          ),
        ],
      ),
    );
  }


  Widget _testDataWidget() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.96,
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[400],
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Image1()));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.015),
                    width: MediaQuery.of(context).size.width * 0.16,
                    child: Text(
                      "2020-04-20",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.017),
                    )),
                Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.015),
                    width: MediaQuery.of(context).size.width * 0.17,
                    child: Text("절단",
                        style: TextStyle(
                            fontSize:
                            MediaQuery.of(context).size.height * 0.017))),
                Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.015),
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: Text("스마트 샘플",
                        style: TextStyle(
                            fontSize:
                            MediaQuery.of(context).size.height * 0.017))),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.015),
                    width: MediaQuery.of(context).size.width * 0.16,
                    child: Text("",
                        style: TextStyle(
                            fontSize:
                            MediaQuery.of(context).size.height * 0.010))),
                Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.015),
                    width: MediaQuery.of(context).size.width * 0.17,
                    child: Text("문짝",
                        style: TextStyle(
                            fontSize:
                            MediaQuery.of(context).size.height * 0.017))),
                Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.015),
                    width: MediaQuery.of(context).size.width * 0.30,
                    child: Text("양개 민짜",
                        style: TextStyle(
                            fontSize:
                            MediaQuery.of(context).size.height * 0.017))),
                Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.015),
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Text("2020-04-20 12:00",
                        style: TextStyle(
                            fontSize:
                            MediaQuery.of(context).size.height * 0.017))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.015),
                    width: MediaQuery.of(context).size.width * 0.16,
                    child: Text("")),
                Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.015),
                    width: MediaQuery.of(context).size.width * 0.47,
                    child: Text("양개 1 EA",
                        style: TextStyle(
                            fontSize:
                            MediaQuery.of(context).size.height * 0.017))),

                Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.015),
                    width: MediaQuery.of(context).size.width * 0.23,
                    child: Text("2020-04-20 12:00",
                        style: TextStyle(
                            fontSize:
                            MediaQuery.of(context).size.height * 0.017))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        //scrollDirection: Axis.vertical,
        //shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          // 홀수 행은 구분자를 넣어준다.
          if (i.isOdd) return Divider(); // 짝수 행은 랜덤한 문자열을 넣어준다.
          final index = i ~/ 2; // i를 2로 나누었을때, 결과의 정수부분을 반환한다.
          if (index >= _suggestions.length) {
            // 가지고 있는 문자열을 모두 소진하면, 10개를 더 불러온다. _
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  String strDateFormat;
  String yDay = DateFormat('yyyy-MM-dd')
      .format(DateTime.now().subtract(Duration(days: 1)));
  String toDay = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final txtFieldStrDate = TextEditingController();

  List _fruits = ["Apple", "Banana", "Pineapple", "Mango", "Grapes"];

  List dataLine = List(); //edited line

  Future<String> getSWData() async {
    String url = 'http://192.168.1.5:9001/mobileLine';

    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: jsonEncode({}));

    var resBody = json.decode(utf8.decode(response.bodyBytes));
    setState(() {
      dataLine = resBody;
      _selectedFruit = dataLine[0]['line_code'];
      print(dataLine);
    });

    return 'Sucess';
  }

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _selectedFruit;

  void callStrDatePicker() async {
    var strDate = await getStrDate();
    setState(() {
      if (strDate != null) {
        txtFieldStrDate.text = DateFormat('yyyy-MM-dd').format(strDate);
      }
    });
  }

  Future<DateTime> getStrDate() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      locale: const Locale('ko', 'KO'),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _dropDownMenuItems = buildAndGetDropDownMenuItems(_fruits);
    _selectedFruit = _dropDownMenuItems[0].value;
    super.initState();
    txtFieldStrDate.text = yDay;
    this.getSWData();
  }

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List fruits) {
    List<DropdownMenuItem<String>> items = new List();
    for (String fruit in fruits) {
      items.add(new DropdownMenuItem(value: fruit, child: new Text(fruit)));
    }
    return items;
  }

  void changedDropDownItem(String selectedFruit) {
    setState(() {
      _selectedFruit = selectedFruit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
        body: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
              Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: 100,
                decoration: BoxDecoration(
                    //border: Border.all(color: Colors.grey[400], width: 1),
                    ),
                child: Table(
                  defaultColumnWidth: FixedColumnWidth(
                      MediaQuery.of(context).size.width * 0.48),
                  children: [
                    TableRow(children: [
                      Container(
                        constraints: BoxConstraints.expand(
                          height: MediaQuery.of(context).size.width * 0.04,
                        ),
                        decoration: new BoxDecoration(
                            //border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey[400]),),
                            color: Colors.grey[200]),
                        child: Text(
                          "계획일자",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.027),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints.expand(
                          height: MediaQuery.of(context).size.width * 0.04,
                        ),
                        decoration: new BoxDecoration(
                            //border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey[400]),),
                            color: Colors.grey[200]),
                        child: Text(
                          "공정",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.027),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Container(
                          //padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                          child: Row(children: <Widget>[
                        Expanded(
                          child: Container(
                            //padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                            height: MediaQuery.of(context).size.height * 0.0489,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey[400],
                              ),
                              //borderRadius: BorderRadius.circular(3)
                            ),
                            child: TextFormField(
                              controller: txtFieldStrDate,
                              textAlignVertical: TextAlignVertical.center,
                              readOnly: true,
                              onTap: callStrDatePicker,
                              onSaved: (String value) {},
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 6.0),
                                border: InputBorder.none,
                                icon: new Icon(
                                  Icons.date_range,
                                  size:
                                      MediaQuery.of(context).size.height * 0.04,
                                  color: Colors.grey,
                                ),
                              ),
                              style: new TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.028,
                              ),
                            ),
                          ),
                        ),
                      ])),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.0489,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey[400],
                          ),
                          //borderRadius: BorderRadius.circular(3)
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            items: dataLine.map((item) {
//                              print(item['line_code'].toString());
                              return new DropdownMenuItem(
                                child: new Text(item['line_name']),
                                value: item['line_code'].toString(),
                              );
                            }).toList(),
                            value: _selectedFruit,
                            onChanged: (newVal) {
                              setState(() {
                                _selectedFruit = newVal;
                              });
                              print(_selectedFruit.toString());
                            },
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.020,
                                color: Colors.black),
                            iconSize: MediaQuery.of(context).size.height * 0.05,
                          ),
                        ),
                      )
                    ])
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            customButton('조회', () {}, context),
            //_headerTitle(),
            Expanded(
              child: SingleChildScrollView(
                  child: new Column(children: <Widget>[
                    _testDataWidget(),
                    _testDataWidget(),
                    _testDataWidget(),
                    _testDataWidget(),
                    _testDataWidget(),
                    _testDataWidget(),
                    _testDataWidget(),
                    _testDataWidget(),
                    _testDataWidget(),
                    _testDataWidget(),
                    _testDataWidget(),
              ])),
            )
            //_buildSuggestions()

            //_buildSuggestions()
          ]),
        ));
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

  customButton(String text, Null Function() onPressed, context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.96,
      child: FlatButton(
        color: Colors.black,
        disabledColor: Colors.grey,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[txtStyle_13(text, context)],
        ),
        onPressed: onPressed,
      ),
    );
  }
}

// 스타일 함수
txtStyle_13(String content, context) {
  return Text(
    content,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: MediaQuery.of(context).size.height * 0.03,
        fontWeight: FontWeight.bold),
  );
}
