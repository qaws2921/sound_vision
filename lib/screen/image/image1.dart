import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Image1 extends StatefulWidget {
  @override
  _Image1State createState() => _Image1State();
}

class _Image1State extends State<Image1> {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: statusBarHeight + 10),
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Center(
        child: Column(

          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: RaisedButton(
                    color: Colors.black,
                    disabledColor: Colors.grey,
                    textColor: Colors.white,
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("이전화면",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.035,
                          fontWeight: FontWeight.bold),),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: RaisedButton(
                    color: Colors.black,
                    disabledColor: Colors.grey,
                    textColor: Colors.white,
                    onPressed: (){},
                    child: Text(
                      "다음화면",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.035,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),



            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.85,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRect(

                  child: PhotoView(
                    filterQuality:FilterQuality.high,
                      basePosition: Alignment.topCenter,
                    imageProvider: AssetImage("assets/image/testimage1.jpg"),
                    minScale: PhotoViewComputedScale.contained * 1.01,
                    // Covered = the smallest possible size to fit the whole screen
                    maxScale: PhotoViewComputedScale.covered * 3,
                    //enableRotation: true,
                    backgroundDecoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                    ),

                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
