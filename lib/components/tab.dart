import 'package:flutter/material.dart';

class MyTab extends StatefulWidget {
  MyTab(this.currentTab) {
    currentTab = currentTab;
  }

  String currentTab;

  @override
  createState() => new MyTabState(currentTab);
}

class MyTabState extends State<MyTab> {
  MyTabState(this.currentTab) {
    currentTab = currentTab;
  }

  String currentTab;
  void onTap(String type) {
    currentTab = type;
    print(currentTab);
  }

  // 下划线 会强制变成是有变量
  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.only(top: 8.0, left: 15, right: 15),
        child: new SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: new Container(
            height: 40,
            child: new Center(
              child: new Row(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(right: 6),
                    child: new GestureDetector(
                      child: Text('待支付定金（6）'),
                      onTap: () => onTap("toBePaid"),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(right: 6),
                    child: new GestureDetector(
                      child: Text('审核中'),
                      onTap: () => onTap("toBePaid"),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(right: 6),
                    child: new GestureDetector(
                      child: Text('待支付首付'),
                      onTap: () => onTap("toBePaid"),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.only(right: 6),
                    child: new GestureDetector(
                      child: Text('待交车'),
                      onTap: () => onTap("toBePaid"),
                    ),
                  )
                ]
              ),
            ),
          ),
        ));
  }
}
