import 'package:flutter/material.dart';
import '../components/search.dart';
import '../components/cardCell.dart';
import '../components/peopleSelect.dart';
import '../animations/fadeInRight.dart';

class CustomerPage extends StatefulWidget {
  @override
  _CustomerPageState createState() => _CustomerPageState();
}

// SingleTickerProviderStateMixin 是vsync: this 需要的
class _CustomerPageState extends State<CustomerPage>
    with TickerProviderStateMixin {
  TabController _tabController;
   Animation<double> animation;
  AnimationController controller;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
     //使用弹性曲线
    controller =  new AnimationController( duration: const Duration(seconds: 1), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: -200.0, end: 0.0).animate(controller);
    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '列表',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('列表'),
            // 左上角图标
            leading: new Icon(Icons.arrow_back_ios),
            backgroundColor: Colors.blue,
            centerTitle: true,
            bottom: TabBar(
              //生成Tab菜单
              controller: _tabController,
              tabs: tabs.map((e) => Tab(text: e)).toList(),
            ),
          ),
          body: new Stack(
            alignment: AlignmentDirectional.topStart,
            children: <Widget>[
              new Column(
                children: <Widget>[
                  new Search("test"),
                  new CardCell({
                    "createdTime": 1552011662,
                    "customerName": "敖莎莎",
                    "goodsName": "科沃兹 2019款 320",
                    "imageUrl": "65de0000c98765246de7",
                    "orderId": "1627402180757518",
                    "phone": "13911655164",
                    "userName": "郑云峰_测试",
                    "status": 0,
                    "statusDisplay": "待支付意向金"
                  }),
                  new Container(
                    width: 200,
                    height: 50,
                    decoration: new BoxDecoration(border: new Border.all()),
                    child: new Center(
                      child: new Text("dddd"),
                    ),
                  ),
                ],
              ),
              new FadeInRight(
                child: new PeopleSelect(""),
                animation: animation,
              )
            ],
          )),
    );
  }
}
