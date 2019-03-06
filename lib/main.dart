// 这个App没有使用Material组件,  如Scaffold.
// 一般来说, app没有使用Scaffold的话，会有一个黑色的背景和一个默认为黑色的文本颜色。
// 这个app，将背景色改为了白色，并且将文本颜色改为了黑色以模仿Material app
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  AppBar addBarBuild(String title, dynamic popupMenu) {
    List<dynamic> menuList = popupMenu["menuList"];
    PopupMenuButton buildMenus() {
      List<PopupMenuItem> menus = [];
      for (var menu in menuList) {
        menus.add(
          new PopupMenuItem(
              value: menu["value"], child: new Text(menu["text"])),
        );
      }

      return new PopupMenuButton(
          icon: new Icon(popupMenu["icon"]),
          itemBuilder: (BuildContext context) => menus,
          onSelected: (dynamic action) {
            dynamic onSelected = () => {};
            menuList.forEach((data) {
              if (data["value"] == action) {
                onSelected = data["onSelected"];
              }
            });
            onSelected();
          });
    }

    return new AppBar(
      title: new Text(title),
      // 左上角图标
      leading: new Icon(Icons.arrow_back_ios),
      backgroundColor: Colors.amber[500],
      centerTitle: true,
      actions: <Widget>[buildMenus()],
    );
  }

  @override
  Widget build(BuildContext context) {
    void addNewCustomer() {
      print("新建客户回调");
    }

    void updateCustomer() {
      print("更新客户回调");
    }

    var appBarInfo = {
      "icon": Icons.add,
      "menuList": [
        {"value": "add", "text": "新建客户", "onSelected": addNewCustomer},
        {"value": "update", "text": "更新客户", "onSelected": updateCustomer}
      ]
    };

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: addBarBuild('首页', appBarInfo),
        body: new Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: new Column(
            children: <Widget>[
              new MyCardWrapper(),
              new Expanded(
                child: new GridView.count(
                  //水平子Widget之间间距
                  crossAxisSpacing: 10.0,
                  //垂直子Widget之间间距
                  mainAxisSpacing: 10.0,
                  //GridView内边距
                  padding: EdgeInsets.all(10.0),
                  //一行的Widget数量
                  crossAxisCount: 2,
                  //子Widget宽高比例
                  childAspectRatio: 2 / 1,
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this would produce 2 rows.
                  // Generate 100 Widgets that display their index in the List
                  children: new List.generate(100, (index) {
                    return new Container(
                      height: 30,
                      child: new Center(
                        child: new Text(
                          'Item $index',
                          style: Theme.of(context).textTheme.headline,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              new Container(
                height: 100,
                child: new Stack(
                  children: <Widget>[new Footer('size')],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
      // decoration: new BoxDecoration(
      //   border: new Border.all(color: Colors.red)
      // ),
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

class Footer extends StatefulWidget {
  Footer(this.name) {
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
    Image home = new Image.asset(
        "images/home${current == 'home' ? '-lighhigh' : ''}.png",
        fit: BoxFit.cover,
        width: 28);
    Image work = new Image.asset(
        'images/work${current == 'work' ? '-lighhigh' : ''}.png',
        fit: BoxFit.cover,
        width: 28);
    Image mine = new Image.asset(
        'images/mine${current == 'mine' ? '-lighhigh' : ''}.png',
        fit: BoxFit.cover,
        width: 28);

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
            child: new Row(children: <Widget>[
              new IconAndText("首页", style, home, () {
                print('home was tapped!');
                _changeCurrent('home');
              }),
              new IconAndText("工作", style, work, () {
                print('work was tapped!');
                _changeCurrent('work');
                _pushWork();
              }),
              new IconAndText("我的", style, mine, () {
                print('mine was tapped!');
                _changeCurrent('mine');
              })
            ]))
      ],
    );
  }
}

class Work extends StatefulWidget {
  Work(this.name) {
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
          new WorkItem('客户', 'images/work.png'),
          new WorkItem('跟进记录', 'images/work.png'),
        ],
      ),
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

@immutable
class IconAndText extends StatelessWidget {
  IconAndText(this.text, this.style, this.image, this.onTap) {
    text = text;
    style = style;
    image = image;
    onTap = onTap;
  }

  String text;
  TextStyle style;
  Image image;
  Function onTap;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
        child: new GestureDetector(
      onTap: onTap,
      child: new Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: image,
          ),
          new Text(
            text,
            style: style,
          )
        ],
      ),
    ));
  }
}

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
        decoration: new BoxDecoration(
            border: new Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey[400]),
        )),
        child: new InkWell(
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
                margin: const EdgeInsets.only(right: 15),
                child: new Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ));
  }
}
