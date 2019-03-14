import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/userInfo.dart';

class CardCellTip extends StatelessWidget {
  CardCellTip(this.orderId, this.statusDisplay) {
    orderId = orderId;
    statusDisplay = statusDisplay;
  }
  String statusDisplay;
  String orderId;
  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: new BoxDecoration(
            border: new Border(
                bottom: new BorderSide(color: Color(0xffffededed), width: 1))),
        height: 42,
        margin: EdgeInsets.only(left: 15, right: 15),
        child: new Center(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Expanded(
                flex: 1,
                child: new Text(
                  "订单编号：$orderId",
                  style: TextStyle(color: Color(0xFFFF999999), fontSize: 12),
                ),
              ),
              new Container(
                color: Color(0xff1aff9100),
                padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
                child: new Text(statusDisplay,
                    style: TextStyle(color: Color(0xFFFFFF9100))),
              )
            ],
          ),
        ));
  }
}

class CardCellFooter extends StatelessWidget {
  CardCellFooter(this.formatted, this.admin) {
    formatted = formatted;
    admin = admin;
  }
  String formatted;
  String admin;
  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 42,
        margin: EdgeInsets.only(left: 15, right: 15),
        child: new Center(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Expanded(
                flex: 1,
                child: new Text(
                  "创建时间：$formatted",
                  style: TextStyle(color: Color(0xFFFF999999), fontSize: 12),
                ),
              ),
              new Text("负责人：$admin",
                  style: TextStyle(color: Color(0xFFFF999999)))
            ],
          ),
        ));
  }
}

class CardCellBody extends StatelessWidget {
  CardCellBody(this.imageUrl, this.phone, this.customerName, this.goodsName) {
    imageUrl = imageUrl;
    phone = phone;
    customerName = customerName;
    goodsName = goodsName;
  }
  String phone;
  String imageUrl;
  String customerName;
  String goodsName;
  @override
  Widget build(BuildContext context) {
    TextStyle style = new TextStyle(fontSize: 14);
    return new Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      decoration: new BoxDecoration(
          border: new Border(
              bottom: new BorderSide(color: Color(0xffffededed), width: 1))),
      child: new Row(
        children: <Widget>[
          new Container(
              padding: EdgeInsets.only(right: 20),
              child: new Image(
                height: 68,
                image: NetworkImage('http://p3.pstatp.com/origin/$imageUrl'),
              )),
          new Container(
            // decoration: new BoxDecoration(border: new Border.all()),
            child: new Column(
              // recored: 对齐方式
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  // decoration: new BoxDecoration(border: new Border.all()),
                  child: new Text("$phone  $customerName",
                      style: style, textAlign: TextAlign.left),
                ),
                // TODO: 使用了Wrap但是还是会超出边界
                new Wrap(
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    new Container(
                      // decoration: new BoxDecoration(border: new Border.all()),
                      child: new Text(goodsName, style: style),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardCell extends StatefulWidget {
  CardCell(this.cardInfo) {
    cardInfo = cardInfo;
  }

  Map<String, dynamic> cardInfo;

  @override
  createState() => new CardCellState(cardInfo);
}

class CardCellState extends State<CardCell> {
  CardCellState(this.cardInfo) {
    cardInfo = cardInfo;
  }
  Map<String, dynamic> cardInfo;
  var user;
  
  String formatTime(num time){
    var now = new DateTime.fromMicrosecondsSinceEpoch(time * 1000 * 1000);
    var formatter = new DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(now);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    var user = new UserInfo.fromJson(cardInfo);
    return new Container(
      color: Color(0xFFFFFFFFFF),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: new Column(
        children: <Widget>[
          new CardCellTip(user.orderId, user.statusDisplay),
          new CardCellBody(user.imageUrl, user.phone, user.customerName, user.goodsName),
          new CardCellFooter(formatTime(user.createdTime), user.userName),
        ],
      )
    );
  }
}
