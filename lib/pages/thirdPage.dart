// 这个App没有使用Material组件,  如Scaffold.
// 一般来说, app没有使用Scaffold的话，会有一个黑色的背景和一个默认为黑色的文本颜色。
// 这个app，将背景色改为了白色，并且将文本颜色改为了黑色以模仿Material app
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        margin: const EdgeInsets.only(left: 15, top: 15),
        child: new Row(
          children: <Widget>[
            new WorkItem('客户', 'images/work.png'),
            new WorkItem('跟进记录', 'images/work.png'),
          ],
        ),
      )
    );
  }
}

class WorkItem extends StatelessWidget {
  WorkItem(this.text, this.url) {
    text = text;
    url = url;
  }
  String text;
  String url;

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
        width: 165,
        height: 165,
        child: new Column(
          children: <Widget>[
            new Container(
              width: 72,
              height: 72,
              margin: const EdgeInsets.all(15),
              child: new Image.asset(url, fit: BoxFit.cover),
            ),
            new Text(
              text,
              style: new TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
