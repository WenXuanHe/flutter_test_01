// 这个App没有使用Material组件,  如Scaffold.
// 一般来说, app没有使用Scaffold的话，会有一个黑色的背景和一个默认为黑色的文本颜色。
// 这个app，将背景色改为了白色，并且将文本颜色改为了黑色以模仿Material app
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  Dio dio = new Dio();

  Future<Map<String, dynamic>> loadData() async{
    final response = await dio.get("https://i.snssdk.com/motor/brand/v4/brand_series_list/?brand_id=2");
    return response.data as Map<String, dynamic>;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('首页'),
            // 左上角图标
            leading: new Icon(Icons.arrow_back_ios),
            backgroundColor: Colors.amber[500],
            centerTitle: true,
            actions: <Widget>[
              new PopupMenuButton<String>(
                  icon: new Icon(Icons.add),
                  itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                        new PopupMenuItem<String>(
                            value: "add", child: new Text('新建客户')),
                      ],
                  onSelected: (String action) {
                    switch (action) {
                      case "add":
                        // do nothing
                        break;
                    }
                  })
            ],
          ),
          body: new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Stack(
              children: <Widget>[
                new FutureBuilder(
                  future: loadData(),
                  builder: (BuildContext context, AsyncSnapshot  snapshot){
                    switch(snapshot.connectionState){
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return new Center(
                          child: new Card(
                            child: new Text('loading ...'),
                          ),
                        );
                      default:
                        if(snapshot.hasError){
                          print('Error: ${snapshot.error}');
                          return new Text('Error: ${snapshot.error}');
                        }else{
                          Map<String, dynamic> valueMap = snapshot.data;
                          print(valueMap.keys);
                          return new RandomWords('text');
                        }
                    }
                  },
                ),
                new Footer('size')
              ],
            ),
          ),
      ),
    );
  }
}


class RandomWords extends StatefulWidget {
  RandomWords(this.name){
    name = name;
  }

  String name;
  
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  // 下划线 会强制变成是有变量

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 90.0,
      margin: const EdgeInsets.all(15.0),
      child: new Card(
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                      child: new Image.asset('images/customer.png', fit: BoxFit.cover),
                    ),
                    new Text(
                      "客户跟进",
                      style: new TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
              new Text(
                '50',
                style: new TextStyle(color: Colors.red, fontSize: 20),
              ),
              new Container(
                margin: const EdgeInsets.only(right: 15),
                child: new Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              )
          ],
        ),
      )
    );
  }
}

class Footer extends StatefulWidget {
  Footer(this.name){
    name = name;
  }

  String name;
  @override
  createState() => new FooterState();
}

class FooterState extends State<Footer> {
  
  String current = 'home';

  void _pushWork() {
      Navigator.of(context).push(
        new MaterialPageRoute(
          builder: (context) {
            return new Scaffold(
              appBar: new AppBar(
                title: new Text('工作'),
              ),
              body: new Work('work'),
              
            );
          },
        ),
      );
    }
    
  @override
  Widget build(BuildContext context) {
    // 获取屏幕的宽带
    double width = MediaQuery.of(context).size.width;
    final style = new TextStyle(fontSize: 11, color: const Color(0xff999999));
    Image home = new Image.asset('images/home.png', fit: BoxFit.cover, width: 28);
    Image work = new Image.asset('images/work.png', fit: BoxFit.cover, width: 28);
    if(current == 'home'){
      home =  new Image.asset('images/home-lighhigh.png', fit: BoxFit.cover, width: 28);
    } else if (current == 'work') {
      work = new Image.asset('images/work-lighhigh.png', fit: BoxFit.cover, width: 28);
    }

    void _changeCurrent(String value) {
      setState(() {
        current = value;
      });
    }

    return new Stack(
        children: <Widget>[
          // new Text('teat')
          new Positioned(
              bottom: 20,
              left: 0,
              width: width,
              child: new Row(
                children: <Widget>[
                    new Expanded(
                      child: new GestureDetector(
                        onTap: () {
                          print('home was tapped!');
                          _changeCurrent('home');
                        },
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: home,
                            ),
                            new Text(
                              '首页',
                              style: style,
                            )
                          ],
                        ),
                      )
                    ),
                    new Expanded(
                      child:  new GestureDetector(
                        onTap: () {
                          print('work was tapped!');
                          _changeCurrent('work');
                          _pushWork();
                        },
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: work,
                            ),
                            new Text(
                              '工作',
                              style: style,
                            )
                          ],
                        ),
                      )
                    ),
                    new Expanded(
                      child: new GestureDetector( 
                        onTap: () {
                          current = 'mine';
                        },
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: new Image.asset('images/mine.png', fit: BoxFit.cover, width: 28),
                            ),
                            new Text(
                              '我的',
                              style: style,
                            )
                          ],
                        ),
                      )
                    ),
                ]
              )
            )
        ],
    );
  }
}

class Work extends  StatefulWidget {
  Work(this.name){
    name = name;
  }
  String name;
  @override
  createState() => new WorkState();
}

class WorkState extends State<Work> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(left: 15, top: 15),
      child: new Row(
        children: <Widget>[
          new WorkItem('客户','images/work.png'),
          new WorkItem('跟进记录', 'images/work.png'),
        ],
      ),
    );
  }
}

class WorkItem extends StatelessWidget {
   WorkItem(this.text, this.url){
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

