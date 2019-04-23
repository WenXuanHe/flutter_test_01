// 这个App没有使用Material组件,  如Scaffold.
// 一般来说, app没有使用Scaffold的话，会有一个黑色的背景和一个默认为黑色的文本颜色。
// 这个app，将背景色改为了白色，并且将文本颜色改为了黑色以模仿Material app
import 'package:flutter/material.dart';
import 'pages/customer.dart';
import 'pages/firstPage.dart';
import 'pages/secondPage.dart';
import 'pages/thirdPage.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

// 定义redux的actions type
// One simple action: Increment
enum Actions { Increment }

// The reducer, which takes the previous count and increments it in response
// to an Increment action.
int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
    return state + 1;
  }

  return state;
}


void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
  
}

class _MyAppState extends State<MyApp>{
  
  final items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.work), title: Text('工作')),
    BottomNavigationBarItem(icon: Icon(Icons.movie_creation), title: Text('我的')),
  ];
  final bodyList = [
    FirstPage(),
    SecondPage(),
    ThirdPage(),
  ];
  int currentIndex = 0;

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

    void onTap(int index){
      setState(() {
        currentIndex = index;
      });
    }

    // Create your store as a final variable in a base Widget. This works better
    // with Hot Reload than creating it directly in the `build` function.
    final store = new Store<int>(counterReducer, initialState: 0);

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Provider包裹， 只有在Provider内修改才能获取到store和修改
      home: new StoreProvider(
        store: store,
        child: new Scaffold(
          appBar: addBarBuild('首页', appBarInfo),
          body: new Column(
            children: <Widget>[
              // String类型是给converter返回的值， 通过StoreConnector获取store
              new StoreConnector<int, String>(
                converter: (store) => store.state.toString(),
                builder: (context, count) => new Text(
                      count,
                      style: Theme.of(context).textTheme.display1,
                    ),
              ),
              new StoreConnector<int, VoidCallback>(
                converter: (store) {
                  // Return a `VoidCallback`, which is a fancy name for a function
                  // with no parameters. It only dispatches an Increment action.
                  // 通过dispatch发起请求
                  return () => store.dispatch(Actions.Increment);
                },
                builder: (context, callback) => new FloatingActionButton(
                  // Attach the `callback` to the `onPressed` attribute
                  onPressed: callback,
                  tooltip: 'Increment',
                  child: new Icon(Icons.add_comment),
                ),
              ),
              // bodyList[currentIndex]
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: items,
            currentIndex: currentIndex,
            onTap: onTap,
          ),
        ),
      ),
      routes: <String, WidgetBuilder>{
        '/customer': (BuildContext context) => CustomerPage()
      },
    );
  }
}
