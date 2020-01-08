import 'package:flutter/material.dart';



class DemoScreen extends StatefulWidget {
  @override
  _DemoScreenState createState() => new _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  List<int> _myList = new List();
  TextEditingController _myController = new TextEditingController();
  String _result = "";
  String _inputList = "";

  setSum() {
    int sum = 0;

    for (int i = 0; i < _myList.length; i++) {
      sum += _myList[i];
      if (i == 0)
        _inputList = "${_myList[i]}";
      else
        _inputList = _inputList + " + ${_myList[i]}";
    }
    _result = "$sum";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Demo App"),
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            margin: new EdgeInsets.symmetric(vertical: 10.0),
            child: new Text(
              _inputList,
              style: new TextStyle(fontSize: 40.0),
            ),
          ),
          new Container(
            margin: new EdgeInsets.symmetric(vertical: 25.0),
            child: new Text(
              _result,
              style: new TextStyle(fontSize: 70.0),
            ),
          ),
          new Container(
            margin: new EdgeInsets.symmetric(horizontal: 50.0),
            child: new TextField(
              controller: _myController,
              keyboardType: TextInputType.number,
              onSubmitted: (text) {
                setState(() {
                  _myList.add(int.parse(text));
                  setSum();
                  _myController.clear();
                });
              },
            ),
          )
        ],
      ),
    );
  }
}