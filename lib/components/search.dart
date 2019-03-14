import 'package:flutter/material.dart';


class Search extends StatefulWidget {
  Search(this.currentTab) {
    currentTab = currentTab;
  }

  String currentTab;

  @override
  createState() => new SearchState(currentTab);
}

class SearchState extends State<Search> {
  SearchState(this.currentTab) {
    currentTab = currentTab;
  }

  String currentTab;
  void _onTap() {
    print('点击了setting');
  }

  // 下划线 会强制变成是有变量
  @override
  Widget build(BuildContext context) {
    TextEditingController _selectionController = new TextEditingController();
    // 创建 focusNode
    FocusNode _focusNode = new FocusNode();
    // 监听onChange事件
    _selectionController.addListener(() {
      print(_selectionController.text);
    });
    _focusNode.addListener(() {
      print(_focusNode.hasFocus);
    });
    return new Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        margin: EdgeInsets.only(top: 15),
        height: 40,
        child: new Center(
          child: new Row(
            children: <Widget>[
              new Expanded(
                flex: 1,
                child: new Center(
                  child: new Container(
                    color: Color(0xFFFFEEEEEE),
                    child: new TextField(
                        controller: _selectionController,
                        focusNode: _focusNode,
                        style:
                            new TextStyle(fontSize: 16.0, color: Colors.black),
                        decoration: new InputDecoration(
                          prefixIcon: new Icon(Icons.search),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(4.0),
                            ),
                          ),
                          //输入内容距离上下左右的距离 ，可通过这个属性来控制 TextField的高度
                          contentPadding: EdgeInsets.all(10.0),
                          // border: InputBorder.none,
                          hintText: '搜索',
                          labelText: null,
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey[800]),
                          // hintText: "Type in your text",
                          fillColor: Colors.white70,
                        )),
                  ),
                ),
              ),
              new Container(
                  padding: EdgeInsets.only(left: 5),
                  // decoration: new BoxDecoration(
                  //   border: new Border.all()
                  // ),
                  child: new Center(
                    child: new GestureDetector(
                      child: new Icon(Icons.settings),
                      onTap: _onTap,
                    ),
                  ))
            ],
          ),
        ));
  }
}
