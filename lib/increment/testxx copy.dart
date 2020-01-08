import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SevenTab extends StatefulWidget {
  @override
  _SevenTabState createState() {
    return _SevenTabState();
  }
}

class _SevenTabState extends State<SevenTab> {
  int _counter = 0;
  int _counter1 = 0;
  
  

  @override
  void initState() {
    super.initState();
    _loadCounter();
    _loadCounter1();
    
  }

  _loadCounter() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _counter = (prefs.getInt('counter') ?? 0);});}

  _loadCounter1() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _counter1 = (prefs.getInt('counter') ?? 0);});}

 


  _incrementCounter() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1; prefs.setInt('counter', _counter);});}

  _incrementCounter0() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _counter = (prefs.getInt('counter') ?? 0) - 1; prefs.setInt('counter', _counter);});}

  _incrementCounter1() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _counter1 = (prefs.getInt('counter') ?? 0) + 1; prefs.setInt('counter', _counter1);});}

  _incrementCounter1s() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _counter1 = (prefs.getInt('counter') ?? 0) - 1; prefs.setInt('counter', _counter1);});}
  
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('test'),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'UP',
                ),
                Text(
                  '$_counter1',
                  style: Theme.of(context).textTheme.display1,
            
                ),
                Text(
                  'Bottom',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
              ]),
        ),
        floatingActionButton: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 31),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  onPressed: _incrementCounter,
                  tooltip: 'Increment Counter',
                  child: Icon(Icons.add),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: _incrementCounter0,
                tooltip: 'Increment Counter',
                child: Icon(Icons.remove),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: FloatingActionButton(
                onPressed: _incrementCounter1,
                tooltip: 'Increment Counter',
                child: Icon(Icons.add),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                onPressed: _incrementCounter1s,
                tooltip: 'Increment Counter',
                child: Icon(Icons.remove),
              ),
            ),
            
          ],
        ));
  }
}
