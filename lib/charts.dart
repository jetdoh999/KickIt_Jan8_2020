import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() =>  _MyHomePageState();
}

class ClicksPerYear {
  final String year;

  final int clicks;

  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color =  charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _counter1 = 0;

  void _incrementCounter() {
    setState(() {_counter++;});}

  void _incrementCounter0() {
    setState(() {_counter--;});}

  void _incrementCounter1() {
    setState(() {_counter1++;});}

  void _incrementCounter1s() {
    setState(() {_counter1--;});}



  @override
  Widget build(BuildContext context) {
    var data = [
       ClicksPerYear('2016', 12, Colors.red),
       ClicksPerYear('2017', _counter1, Colors.yellow),
       ClicksPerYear('2018', _counter, Colors.green),
    ];

    var series = [
       charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'Clicks',
        data: data,
      ),
    ];

    var chart =  charts.BarChart(
      series,
      animate: true,
    );

    var chartWidget =  Padding(
      padding:  EdgeInsets.all(32.0),
      child:  SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

    return  Scaffold(
      
      body:  Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
              'You have pushed the button this many times:',
            ),
             Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              '$_counter1',
              style: Theme.of(context).textTheme.display1,
            ),
            chartWidget,
          ],
        ),
      ),

      floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: _incrementCounter,
                  child: Icon(Icons.navigate_before),
                ),
                FloatingActionButton(
                  onPressed: _incrementCounter0,
                  child: Icon(Icons.navigate_next),
                ),
                FloatingActionButton(
                  onPressed: _incrementCounter1,
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: _incrementCounter1s,
                  child: Icon(Icons.dashboard),
                )
              ],
            ),
          )


      
    );
  }
}
