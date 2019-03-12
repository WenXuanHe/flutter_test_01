import 'package:flutter/material.dart';
import './myCard.dart';

class MyCardWrapper extends StatefulWidget {
  @override
  createState() => new MyCardWrapperState();
}

class MyCardWrapperState extends State<MyCardWrapper> {
  // 下划线 会强制变成是有变量
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: new Column(
        children: <Widget>[
          new MyCard("客户跟进", 50,
              new Image.asset('images/customer.png', fit: BoxFit.cover)),
          new MyCard("跟进详情", 50,
              new Image.asset('images/customer.png', fit: BoxFit.cover)),
        ],
      ),
    );
  }
}