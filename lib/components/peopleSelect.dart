import 'package:flutter/material.dart';

class PeopleSelect extends StatefulWidget {
  PeopleSelect(this.currentTab) {
    currentTab = currentTab;
  }

  String currentTab;

  @override
  createState() => new PeopleSelectState(currentTab);
}

class PeopleSelectState extends State<PeopleSelect> {
  PeopleSelectState(this.currentTab) {
    currentTab = currentTab;
  }

  String currentTab;
  void onTap(String type) {
    currentTab = type;
    print(currentTab);
  }

  // 下划线 会强制变成是有变量
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Text('负责人'),
        new Container(
          height: 200,
          width: 200,
          decoration: new BoxDecoration(border: new Border.all()),
          child: new Column(
            children: <Widget>[
              new Expanded(
                child: new ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(title: Text("$index"));
                    }),
              )
            ],
          ),
        )
      ],
    );
  }
}
