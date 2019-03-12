import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  MyCard(this.text, this.number, this.image) {
    text = text;
    image = image;
    number = number;
  }

  String text;
  int number;
  Image image;
  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: new BoxDecoration(boxShadow: [
          new BoxShadow(
            color: Color(0x10000000),
            blurRadius: 10,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ]),
        child: new Container(
            height: 90,
            margin: const EdgeInsets.only(bottom: 10),
            color: Colors.white,
            child: new Material(
              color: Colors.transparent,
              child: new InkWell(
                highlightColor: Color(0x10000000),
                splashColor: Color(0x100000ff),
                onTap: () {
                  print("添加水波纹效果");
                },
                child: new Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Expanded 建立一个flex的弹性盒子, 默认flex为1
                    new Expanded(
                      flex: 1,
                      child: new Row(
                        children: <Widget>[
                          new Container(
                            width: 28,
                            height: 28,
                            margin: const EdgeInsets.all(15),
                            child: image,
                          ),
                          new Text(
                            text,
                            style: new TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    new Text(
                      number.toString(),
                      style: new TextStyle(color: Colors.red, fontSize: 20),
                    ),
                    new Container(
                      margin: const EdgeInsets.only(right: 15, left: 10),
                      child: new Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey[500],
                        size: 14,
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
