import 'package:flutter/material.dart';
import '../components/search.dart';
import '../components/cardCell.dart';

class CustomerPage extends StatefulWidget {
  @override
  _CustomerPageState createState() => _CustomerPageState();
}

// SingleTickerProviderStateMixin 是vsync: this 需要的
class _CustomerPageState extends State<CustomerPage>  with SingleTickerProviderStateMixin {

  TabController _tabController; 
  List tabs = ["新闻", "历史", "图片"];

   @override
  void initState() {
    super.initState();
    // 创建Controller  
    _tabController = TabController(length: tabs.length, vsync: this);
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
          bottom: TabBar(   //生成Tab菜单
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList(),
          ),
        ),
        body: new Column(
          children: <Widget>[
            new Search("test"),
            new CardCell({
              
            })
          ],
        )
      ),
    );
  }
}



