import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_ui_designs/appss.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FourTab extends StatefulWidget {
  @override
  _FourTabState createState() => _FourTabState();
}

class ClicksPerYear {
  final String year;
  int clicks;
  final charts.Color color;

  ClicksPerYear(this.year, this.clicks, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

int clicks = 0;

class _FourTabState extends State<FourTab> {
  int _counter = 0;
  int _counter1 = 0;
  int _counter2 = 0;
  int _counter3 = 0;
  int _counter4 = 0;
  int _counter5 = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  //Loading counter value on start
  _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

  //Incrementing counter after click
  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  

  void _incrementCounter0() {
    setState(() {
      _counter--;
    });
  }

  void _incrementCounter1() {
    setState(() {
      _counter1++;
    });
  }

  void _incrementCounter1s() {
    setState(() {
      _counter1--;
    });
  }

  void _incrementCounter2() {
    setState(() {
      _counter2++;
    });
  }

  void _incrementCounter2s() {
    setState(() {
      _counter2--;
    });
  }

  void _incrementCounter3() {
    setState(() {
      _counter3++;
    });
  }

  void _incrementCounter3s() {
    setState(() {
      _counter3--;
    });
  }

  void _incrementCounter4() {
    setState(() {
      _counter4++;
    });
  }

  void _incrementCounter4s() {
    setState(() {
      _counter4--;
    });
  }

  void _incrementCounter5() {
    setState(() {
      _counter5++;
    });
  }

  void _incrementCounter5s() {
    setState(() {
      _counter5--;
    });
  }

  Color primaryColor = Colors.black12;

  @override
  Widget build(BuildContext context) {
    var data = [
      ClicksPerYear('Match', _counter, Colors.green),
      ClicksPerYear('Goal', _counter1, Colors.blue),
      ClicksPerYear('Assist', _counter2, Colors.purple),
      ClicksPerYear('Clean', _counter3, Colors.white),
      ClicksPerYear('Yello', _counter4, Colors.yellow),
      ClicksPerYear('Red', _counter5, Colors.red),
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

    var chart = charts.BarChart(
      series,
      animate: true,
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(15.0),
      child: SizedBox(height: 180.0, child: chart),
    );

    return MaterialApp(
        home: Container(
          
            child: Stack(fit: StackFit.expand, children: <Widget>[
              Scaffold(
                
                  backgroundColor: Colors.white70,
                  body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Stack(children: <Widget>[
                                      Container(
                                        height: 771,
                                        decoration: BoxDecoration(
                                          
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(0)),
                                        ),
                                      ),
                                      Stack(children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, top: 35, right: 10),
                                          child: Container(
                                            height: 400,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(4),
                                                    topRight:
                                                        Radius.circular(4),
                                                    bottomLeft:
                                                        Radius.circular(4),
                                                    bottomRight:
                                                        Radius.circular(4)),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/topview.jpg"),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 25.0, right: 10, left: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                IconButton(
                                                  icon: Icon(Icons.arrow_back),
                                                  color: Colors.black54,
                                                  iconSize: 25.0,
                                                  onPressed: () {
                                                  Navigator.pop(
                                                  context,
                                                  MaterialPageRoute(
                                                 builder: (_) => CustomAppBarDemo()));
                                                },
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                      Icons.notifications_none),
                                                  color: Colors.black54,
                                                  iconSize: 25.0,
                                                  onPressed: () {},
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 25.0, vertical: 63.0),
                                          child: Text('Friendly Statistics',
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.8),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 25.0, vertical: 94.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 330.0,
                                            decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0)),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.white24
                                                          .withOpacity(0.7),
                                                      offset: Offset(0.0, 0.5),
                                                      blurRadius: 15.0)
                                                ]),
                                            child: Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 25.0,
                                                      vertical: 25.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: <Widget>[
                                                          Text(
                                                            '2019 Year',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black45,
                                                                fontSize: 30.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                              height: 15.0),
                                                          Text(
                                                            'Avelilable Balance',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black45,
                                                              fontSize: 14.0,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      IconButton(
                                                        icon: Icon(
                                                            Icons.show_chart),
                                                        onPressed: () {},
                                                        color: Colors.white,
                                                        iconSize: 30.0,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                chartWidget
                                              ],
                                            ),
                                          ),
                                        ),
                                        Stack(children: <Widget>[
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  right: 10,
                                                  left: 10,
                                                  top: 483),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Colors.green,
                                                                gradient:
                                                                    LinearGradient(
                                                                  begin: FractionalOffset
                                                                      .bottomLeft,
                                                                  end: FractionalOffset
                                                                      .topRight,
                                                                  colors: <
                                                                      Color>[
                                                                    Colors
                                                                        .green,
                                                                    Colors
                                                                        .greenAccent
                                                                  ],
                                                                ),
                                                                borderRadius: BorderRadius.circular(5),
                                                                boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .black26,
                                                                  offset:
                                                                      Offset(
                                                                          2, 2))
                                                            ]),
                                                        height: 55,
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 15.0,
                                                          right: 15,
                                                        ),
                                                        child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Material(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                color: Colors
                                                                    .transparent,
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              4.0),
                                                                  child: Text(
                                                                    'Matchs',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            19.0,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                              Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: <
                                                                      Widget>[
                                                                    SizedBox.fromSize(
                                                                        size: Size(40, 40),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.black,
                                                                                child: InkWell(
                                                                                    splashColor: Colors.white,
                                                                                    onTap: _incrementCounter0,

                                                                                    child: Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: <Widget>[
                                                                                        Icon(
                                                                                          Icons.remove,
                                                                                          size: 25,
                                                                                        ),
                                                                                      ],
                                                                                    ))))),
                                                                    SizedBox(
                                                                        width:
                                                                            15.0),
                                                                    SizedBox.fromSize(
                                                                        size: Size(40, 40),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.white70,
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: <Widget>[
                                                                                    Text('$_counter',
                                                                                        style: TextStyle(
                                                                                          fontSize: 22.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        )),
                                                                                  ],
                                                                                )))),
                                                                    SizedBox(
                                                                        width:
                                                                            15.0),
                                                                    SizedBox.fromSize(
                                                                        size: Size(40, 40),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.transparent,
                                                                                child: InkWell(
                                                                                    splashColor: Colors.white,
                                                                                    onTap: _incrementCounter,
                                                                                    child: Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: <Widget>[
                                                                                        Icon(
                                                                                          Icons.add,
                                                                                          size: 25,
                                                                                        ),
                                                                                      ],
                                                                                    ))))),
                                                                  ]),
                                                            ])),
                                                    
                                                    Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Colors.blue,
                                                                gradient:
                                                                    LinearGradient(
                                                                  begin: FractionalOffset
                                                                      .bottomLeft,
                                                                  end: FractionalOffset
                                                                      .topRight,
                                                                  colors: <
                                                                      Color>[
                                                                    Colors
                                                                        .blue,
                                                                    Colors
                                                                        .blueAccent
                                                                  ],
                                                                ),
                                                                borderRadius: BorderRadius.circular(5),
                                                                boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .black26,
                                                                  offset:
                                                                      Offset(
                                                                          2, 2))
                                                            ]),
                                                        height: 55,
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 15.0,
                                                          right: 15,
                                                        ),
                                                        child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Material(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                color: Colors
                                                                    .transparent,
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              4.0),
                                                                  child: Text(
                                                                    'Goal',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            19.0,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                              Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: <
                                                                      Widget>[
                                                                    SizedBox.fromSize(
                                                                        size: Size(40, 40),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.transparent,
                                                                                child: InkWell(
                                                                                    splashColor: Colors.white,
                                                                                    onTap: _incrementCounter1s,
                                                                                    child: Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: <Widget>[
                                                                                        Icon(
                                                                                          Icons.remove,
                                                                                          size: 25,
                                                                                        ),
                                                                                      ],
                                                                                    ))))),
                                                                    SizedBox(
                                                                        width:
                                                                            15.0),
                                                                    SizedBox.fromSize(
                                                                        size: Size(40, 40),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.white70,
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: <Widget>[
                                                                                    Text('$_counter1',
                                                                                        style: TextStyle(
                                                                                          fontSize: 22.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        )),
                                                                                  ],
                                                                                )))),
                                                                    SizedBox(
                                                                        width:
                                                                            15.0),
                                                                    SizedBox.fromSize(
                                                                        size: Size(40, 40),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.transparent,
                                                                                child: InkWell(
                                                                                    splashColor: Colors.white,
                                                                                    onTap: _incrementCounter1,
                                                                                    child: Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: <Widget>[
                                                                                        Icon(
                                                                                          Icons.add,
                                                                                          size: 25,
                                                                                        ),
                                                                                      ],
                                                                                    ))))),
                                                                  ]),
                                                            ])),
                                                    
                                                    Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Colors.purple,
                                                                gradient:
                                                                    LinearGradient(
                                                                  begin: FractionalOffset
                                                                      .bottomLeft,
                                                                  end: FractionalOffset
                                                                      .topRight,
                                                                  colors: <
                                                                      Color>[
                                                                    Colors
                                                                        .purple,
                                                                    Colors
                                                                        .purpleAccent
                                                                  ],
                                                                ),
                                                                borderRadius: BorderRadius.circular(5),
                                                                boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .black26,
                                                                  offset:
                                                                      Offset(
                                                                          2, 2))
                                                            ]),
                                                        height: 55,
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 15.0,
                                                          right: 15,
                                                        ),
                                                        child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Material(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                color: Colors
                                                                    .transparent,
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              4.0),
                                                                  child: Text(
                                                                    'Assist',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            19.0,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                              Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: <
                                                                      Widget>[
                                                                    SizedBox.fromSize(
                                                                        size: Size(40, 40),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.transparent,
                                                                                child: InkWell(
                                                                                    splashColor: Colors.white,
                                                                                    onTap: _incrementCounter2s,
                                                                                    child: Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: <Widget>[
                                                                                        Icon(
                                                                                          Icons.remove,
                                                                                          size: 25,
                                                                                        ),
                                                                                      ],
                                                                                    ))))),
                                                                    SizedBox(
                                                                        width:
                                                                            15.0),
                                                                    SizedBox.fromSize(
                                                                        size: Size(40, 40),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.white70,
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: <Widget>[
                                                                                    Text('$_counter2',
                                                                                        style: TextStyle(
                                                                                          fontSize: 22.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        )),
                                                                                  ],
                                                                                )))),
                                                                    SizedBox(
                                                                        width:
                                                                            15.0),
                                                                    SizedBox.fromSize(
                                                                        size: Size(40, 40),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.transparent,
                                                                                child: InkWell(
                                                                                    splashColor: Colors.white,
                                                                                    onTap: _incrementCounter2,
                                                                                    child: Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: <Widget>[
                                                                                        Icon(
                                                                                          Icons.add,
                                                                                          size: 25,
                                                                                        ),
                                                                                      ],
                                                                                    ))))),
                                                                  ]),
                                                            ])),
                                                    
                                                    Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Colors.blue,
                                                                gradient:
                                                                    LinearGradient(
                                                                  begin: FractionalOffset
                                                                      .bottomLeft,
                                                                  end: FractionalOffset
                                                                      .topRight,
                                                                  colors: <
                                                                      Color>[
                                                                    Colors
                                                                        .white,
                                                                    Colors
                                                                        .white70
                                                                  ],
                                                                ),
                                                                borderRadius: BorderRadius.circular(5),
                                                                boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .black26,
                                                                  offset:
                                                                      Offset(
                                                                          2, 2))
                                                            ]),
                                                        height: 55,
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 15.0,
                                                          right: 15,
                                                        ),
                                                        child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Material(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                color: Colors
                                                                    .transparent,
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              4.0),
                                                                  child: Text(
                                                                    'Clean Sheet',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            19.0,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                              Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: <
                                                                      Widget>[
                                                                    SizedBox.fromSize(
                                                                        size: Size(40, 40),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.transparent,
                                                                                child: InkWell(
                                                                                    splashColor: Colors.white,
                                                                                    onTap: _incrementCounter3s,
                                                                                    child: Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: <Widget>[
                                                                                        Icon(
                                                                                          Icons.remove,
                                                                                          size: 25,
                                                                                        ),
                                                                                      ],
                                                                                    ))))),
                                                                    SizedBox(
                                                                        width:
                                                                            15.0),
                                                                    SizedBox.fromSize(
                                                                        size: Size(40, 40),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.white70,
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: <Widget>[
                                                                                    Text('$_counter3',
                                                                                        style: TextStyle(
                                                                                          fontSize: 22.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        )),
                                                                                  ],
                                                                                )))),
                                                                    SizedBox(
                                                                        width:
                                                                            15.0),
                                                                    SizedBox.fromSize(
                                                                        size: Size(40, 40),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.transparent,
                                                                                child: InkWell(
                                                                                    splashColor: Colors.white,
                                                                                    onTap: (_incrementCounter3),
                                                                                    child: Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: <Widget>[
                                                                                        Icon(
                                                                                          Icons.add,
                                                                                          size: 25,
                                                                                        ),
                                                                                      ],
                                                                                    ))))),
                                                                  ]),
                                                            ])),
                                                    
                                                    Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Colors.yellow,
                                                                gradient:
                                                                    LinearGradient(
                                                                  begin: FractionalOffset
                                                                      .bottomLeft,
                                                                  end: FractionalOffset
                                                                      .topRight,
                                                                  colors: <
                                                                      Color>[
                                                                    Colors
                                                                        .yellow[300],
                                                                    Colors
                                                                        .yellow[400]
                                                                  ],
                                                                ),
                                                                borderRadius: BorderRadius.circular(5),
                                                                boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .black26,
                                                                  offset:
                                                                      Offset(
                                                                          2, 2))
                                                            ]),
                                                        height: 55,
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 15.0,
                                                          right: 15,
                                                        ),
                                                        child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Material(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                color: Colors
                                                                    .transparent,
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              4.0),
                                                                  child: Text(
                                                                    'Yello',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            19.0,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                              Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: <
                                                                      Widget>[
                                                                    SizedBox.fromSize(
                                                                        size: Size(40, 40),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.transparent,
                                                                                child: InkWell(
                                                                                    splashColor: Colors.white,
                                                                                    onTap: _incrementCounter4s,
                                                                                    child: Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: <Widget>[
                                                                                        Icon(
                                                                                          Icons.remove,
                                                                                          size: 25,
                                                                                        ),
                                                                                      ],
                                                                                    ))))),
                                                                    SizedBox(
                                                                        width:
                                                                            15.0),
                                                                    SizedBox.fromSize(
                                                                        size: Size(40, 40),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.white70,
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: <Widget>[
                                                                                    Text('$_counter4',
                                                                                        style: TextStyle(
                                                                                          fontSize: 22.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        )),
                                                                                  ],
                                                                                )))),
                                                                    SizedBox(
                                                                        width:
                                                                            15.0),
                                                                    SizedBox.fromSize(
                                                                        size: Size(40, 40),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.transparent,
                                                                                child: InkWell(
                                                                                    splashColor: Colors.white,
                                                                                    onTap: _incrementCounter4,
                                                                                    child: Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: <Widget>[
                                                                                        Icon(
                                                                                          Icons.add,
                                                                                          size: 25,
                                                                                        ),
                                                                                      ],
                                                                                    ))))),
                                                                  ]),
                                                            ])),
                                                    
                                                    Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                color:
                                                                    Colors.red,
                                                                gradient:
                                                                    LinearGradient(
                                                                  begin: FractionalOffset
                                                                      .bottomLeft,
                                                                  end: FractionalOffset
                                                                      .topRight,
                                                                  colors: <
                                                                      Color>[
                                                                    Colors
                                                                        .red[300],
                                                                    Colors
                                                                        .red[400]
                                                                  ],
                                                                ),
                                                                borderRadius: BorderRadius.circular(5),
                                                                boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .black26,
                                                                  offset:
                                                                      Offset(
                                                                          2, 2))
                                                            ]),
                                                        height: 55,
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 15.0,
                                                          right: 15,
                                                        ),
                                                        child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Material(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                                color: Colors
                                                                    .transparent,
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              4.0),
                                                                  child: Text(
                                                                    'Red',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            19.0,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                              Row(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: <
                                                                      Widget>[
                                                                    SizedBox.fromSize(
                                                                        size: Size(40, 40),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.transparent,
                                                                                child: InkWell(
                                                                                    splashColor: Colors.white,
                                                                                    onTap: _incrementCounter5s,
                                                                                    child: Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: <Widget>[
                                                                                        Icon(
                                                                                          Icons.remove,
                                                                                          size: 25,
                                                                                        ),
                                                                                      ],
                                                                                    ))))),
                                                                    SizedBox(
                                                                        width:
                                                                            15.0),
                                                                    SizedBox.fromSize(
                                                                        size: Size(40, 40),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.white70,
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: <Widget>[
                                                                                    Text('$_counter5',
                                                                                        style: TextStyle(
                                                                                          fontSize: 22.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                        )),
                                                                                  ],
                                                                                )))),
                                                                    SizedBox(
                                                                        width:
                                                                            15.0),
                                                                    SizedBox.fromSize(
                                                                        size: Size(40, 40),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.transparent,
                                                                                child: InkWell(
                                                                                    splashColor: Colors.white,
                                                                                    onTap: _incrementCounter5,
                                                                                    child: Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: <Widget>[
                                                                                        Icon(
                                                                                          Icons.add,
                                                                                          size: 25,
                                                                                        ),
                                                                                      ],
                                                                                    ))))),
                                                                  ]),
                                                            ])),
                                                  ]))
                                        ])
                                      ])
                                    ]))))
                      ]))
            ])));
  }
}
