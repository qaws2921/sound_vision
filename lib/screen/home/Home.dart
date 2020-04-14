import 'package:flutter/material.dart';
import 'package:soundvision/data/shared/sharedPreferencesData.dart';

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
      ),
      body: Center(child: Text("sss")),
      drawer: new Drawer(
          child: new ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          new Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: new Image.asset('assets/logo/logo@2x-1.png'),
            ),
            color: Colors.black,
            height: 250,
          ),
          new ListTile(
            leading: new Icon(Icons.photo),
            title: new Text("Photo"),
            trailing: new Text(
              "96",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
//                  Navigator.pop(context);
//                  Navigator.of(context).pushNamed(PHOTO_CONTAINER_SCREEN);
            },
          ),
          new ListTile(
            leading: new Icon(Icons.video_library),
            title: new Text("Video"),
            trailing: new Text(
              "58",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
//                  Navigator.pop(context);
//                  Navigator.of(context).pushNamed(VIDEO_CONTAINER_SCREEN);
            },
          ),
          new ListTile(
            leading: new Icon(Icons.photo_library),
            trailing: new Text(
              "56",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            title: new Text("Album"),
            onTap: () {
//                  Navigator.pop(context);
//                  Navigator.of(context).pushNamed(ALBUM_CONTAINER_SCREEN);
            },
          )
        ],
      )),
    );
    ;
  }
}
