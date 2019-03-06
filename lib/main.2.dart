import 'package:flutter/material.dart';

void main() => runApp(new MyApp());


// Container也是一个widget，允许您自定义其子widget。如果要添加填充，边距，边框或背景色，请使用Container来设置
// 每个Text放置在Container中以添加边距。整个行也被放置在容器中以在行的周围添加填充。
// 创建一个Text widget: new Text('Hello World', style: new TextStyle(fontSize: 32.0))
// 创建一个 Image widget: new Image.asset('images/myPic.jpg', fit: BoxFit.cover)
// 创建一个 Icon widget: new Icon(Icons.star, color: Colors.red[500])
// 布局widget， 包含child属性  如：Center, Container 或者一个 children属性，如果他们需要一个widget列表 , Row Column，ListView或Stack
// 最常见的布局模式之一是垂直或水平排列widget。您可以使用行(Row)水平排列widget，并使用列（Column）垂直排列widget。
// 对齐widgets， mainAxisAlignment  和  crossAxisAlignment 
// 调整 widget   Expanded widget具有一个flex属性，它是一个整数，用于确定widget的弹性系数,默认弹性系数是1。
// 聚集 widgets  mainAxisSize: MainAxisSize.min,
// 常用布局widgets  
// Expanded flex
// Container ： 添加 padding, margins, borders, background color, 或将其他装饰添加到widget.
// GridView： 将 widgets 排列为可滚动的网格 grid布局类似.
// ListView 将widget排列为可滚动列表
// Stack 将widget重叠在另一个widget之上.
// Card 将相关内容放到带圆角和投影的盒子中
// ListTile 将最多3行文字，以及可选的行前和和行尾的图标排成一行
// 这种形式可以代表一个数组列表
// InkWell 可以添加水波纹效果， 自带ontap事件
// Stack  可以定位， 在使用的时候注意要给它添加一个固定的区域，如果不添加，就有可能出现超出当前区域的错误。
// <Widget>[
//   new IconButton(),
//   new Expanded()
// ]
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    Widget titleSection = new GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      onDoubleTap: (){
        print('MyButton was doubleTap!');
      },
      child: new Container(
        padding: const EdgeInsets.all(32.0),
        child: new Row(
          children: [
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: new Text(
                      'Oeschinen Lake Campground',
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  new Text(
                    'Kandersteg, Switzerland',
                    style: new TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            new Icon(
              Icons.star,
              color: Colors.red[500],
            ),
            new Text('41'),
          ],
        ),
      ),
    );

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;

      return new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
        Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('Saved Suggestions'),
          ),
          body: new ListView(
            children: [
              new Image.asset(
                'images/lake.jpg',
                height: 240.0,
                fit: BoxFit.cover,
              ),
              titleSection,
              buttonSection,
              textSection,
            ],
          )
      ),
    );
  }
}