import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_ui_designs/appss.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TeamStats extends StatefulWidget {
  @override
  _TeamStatsState createState() => _TeamStatsState();
}

class ClicksPerYear {
  final String year;
  int kick;
  final charts.Color color;

  ClicksPerYear(this.year, this.kick, Color color)
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

int kick = 0;

class _TeamStatsState extends State<TeamStats> {
  int _count = 0;
  int _count1 = 0;
  int _count2 = 0;
  int _count3 = 0;
  int _count4 = 0;
  int _count5 = 0;
  

  @override
  void initState() {
    super.initState();
    _loadx();
    _loadx1();
    _loadx2();
    _loadx3();
    _loadx4();
    _loadx5();
    
  }

  _loadx() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _count = (prefs.getInt('count') ?? 0);});}

  _loadx1() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _count1 = (prefs.getInt('count1') ?? 0);});}

  _loadx2() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _count2 = (prefs.getInt('count2') ?? 0);});}    
  
  _loadx3() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _count3 = (prefs.getInt('count3') ?? 0);});}

  _loadx4() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _count4 = (prefs.getInt('count4') ?? 0);});}

  _loadx5() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _count5 = (prefs.getInt('count5') ?? 0);});}  

  

  _incrementCount() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _count = (prefs.getInt('count') ?? 0) + 1; prefs.setInt('count', _count);});}

  _incrementCount0() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _count = (prefs.getInt('count') ?? 0) - 1; prefs.setInt('count', _count);});}

  _incrementCount1() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _count1 = (prefs.getInt('count1') ?? 0) + 1; prefs.setInt('count1', _count1);});}

  _incrementCount1s() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _count1 = (prefs.getInt('count1') ?? 0) - 1; prefs.setInt('count1', _count1);});}
  
  _incrementCount2() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _count2 = (prefs.getInt('count2') ?? 0) + 1; prefs.setInt('count2', _count2);});}

  _incrementCount2s() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _count2 = (prefs.getInt('count2') ?? 0) - 1; prefs.setInt('count2', _count2);});}

  _incrementCount3() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _count3 = (prefs.getInt('count3') ?? 0) + 1; prefs.setInt('count3', _count3);});}

  _incrementCount3s() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _count3 = (prefs.getInt('count3') ?? 0) - 1; prefs.setInt('count3', _count3);});}

  _incrementCount4() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _count4 = (prefs.getInt('count4') ?? 0) + 1; prefs.setInt('count4', _count4);});}

  _incrementCount4s() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _count4 = (prefs.getInt('count4') ?? 0) - 1; prefs.setInt('count4', _count4);});}

  _incrementCount5() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _count5 = (prefs.getInt('count5') ?? 0) + 1; prefs.setInt('count5', _count5);});}

  _incrementCount5s() async {SharedPreferences prefs = await SharedPreferences.getInstance();setState(() {
      _count5 = (prefs.getInt('count5') ?? 0) - 1; prefs.setInt('count5', _count5);});}



  Color primaryColor = Colors.black12;

  var finaldate;

  void callDatePicker() async {
    var order = await getDate();
    setState(() {
      finaldate = order;
    });
  }

  Future<DateTime> getDate() {
    // Imagine that this function is
    // more complex and slow.
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    var data = [
      ClicksPerYear('Match', _count, Colors.green),
      ClicksPerYear('Won', _count1, Colors.blue),
      ClicksPerYear('Draw', _count2, Colors.white),
      ClicksPerYear('Loose', _count3, Colors.blueGrey),
      ClicksPerYear('Goal+', _count4, Colors.greenAccent),
      ClicksPerYear('Goal-', _count5, Colors.red),
    ];

    var series = [
      charts.Series(
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.kick,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        id: 'kick',
        data: data,
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: true,
    );

    var chartWidget = Padding(
      padding: EdgeInsets.all(15.0),
      child: SizedBox(height: 200.0, child: chart),
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
                                              left: 10, top: 30, right: 10),
                                          child: Container(
                                            height: 403,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(4),
                                                    topRight: Radius.circular(4),
                                                    bottomLeft:Radius.circular(4),
                                                    bottomRight:Radius.circular(4)),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/field.jpg"),
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
                                                  color: Colors.white54,
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
                                                  color: Colors.white54,
                                                  iconSize: 25.0,
                                                  onPressed: () {},
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 25.0, vertical: 78.0),
                                          child: Text('Team Statistics',
                                              style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 25.0, vertical: 120),
                                          child: Container(
                                            width: double.infinity,
                                            height: 300.0,
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
                                                      vertical: 20.0),
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
                                                            MainAxisSize.max,
                                                        children: <Widget>[


              Container(
              decoration: BoxDecoration(color: Colors.transparent),
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: finaldate == null ? 
              Text("Start Date to Record",textScaleFactor: 1.2,) 
              : Text("$finaldate",textScaleFactor: 1.3,),
            ),
                    
                                                        ],
                                                      ),
                                                      
                                                    ],
                                                  ),
                                                ), 
                                                chartWidget
                                              ],
                                            ),
                                          ),
                                        ),




                                        Padding(
                                      padding: EdgeInsets.only(
                                      top: 160, right: 0, left: 37),
                                      child: Container(
                                        decoration: BoxDecoration(color: Colors.transparent),
                                        padding: EdgeInsets.symmetric(horizontal: 0),
                                        child: IconButton(
                                                        icon: Icon(
                                                            Icons.calendar_today),
                                                        onPressed: callDatePicker,
                                                        color: Colors.black87,
                                                        iconSize: 25.0,
                                                      )
                                        )),
                                        

                                        Stack(children: <Widget>[
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  right: 10,
                                                  left: 10,
                                                  top: 448),
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text('Record your stats & Reset to zero for additional record',
                                                       style: TextStyle(
                                                       color: Colors.black,
                                                              fontSize: 14.0,
                                                            ),
                                                          ),
                                                          SizedBox(height:
                                                                  10.0),
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
                                                                        .green.shade500
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
                                                                    'Match',
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
                                                                                    onTap: _incrementCount0,
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
                                                                        size: Size(45, 45),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.white70,
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: <Widget>[
                                                                                    Text('$_count',
                                                                                        style: TextStyle(
                                                                                          fontSize: 19.0,
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
                                                                                    onTap: _incrementCount,
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
                                                                    'Won',
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
                                                                                    onTap: _incrementCount1s,
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
                                                                        size: Size(45, 45),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.white70,
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: <Widget>[
                                                                                    Text('$_count1',
                                                                                        style: TextStyle(
                                                                                          fontSize: 19.0,
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
                                                                                    onTap: _incrementCount1,
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
                                                                    'Draw',
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
                                                                                    onTap: _incrementCount2s,
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
                                                                        size: Size(45, 45),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.white70,
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: <Widget>[
                                                                                    Text('$_count2',
                                                                                        style: TextStyle(
                                                                                          fontSize: 19.0,
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
                                                                                    onTap: _incrementCount2,
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
                                                                        .blueGrey,
                                                                    Colors
                                                                        .blueGrey.shade800
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
                                                                    'Loose',
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
                                                                                    onTap: _incrementCount3s,
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
                                                                        size: Size(45, 45),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.white70,
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: <Widget>[
                                                                                    Text('$_count3',
                                                                                        style: TextStyle(
                                                                                          fontSize: 19.0,
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
                                                                                    onTap: (_incrementCount3),
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
                                                                        .greenAccent.shade100,
                                                                    Colors
                                                                        .greenAccent.shade200
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
                                                                    'Goal+',
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
                                                                                    onTap: _incrementCount4s,
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
                                                                        size: Size(45, 45),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.white70,
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: <Widget>[
                                                                                    Text('$_count4',
                                                                                        style: TextStyle(
                                                                                          fontSize: 19.0,
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
                                                                                    onTap: _incrementCount4,
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
                                                                    'Goal-',
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
                                                                                    onTap: _incrementCount5s,
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
                                                                        size: Size(45, 45),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.white70,
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: <Widget>[
                                                                                    Text('$_count5',
                                                                                        style: TextStyle(
                                                                                          fontSize: 19.0,
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
                                                                                    onTap: _incrementCount5,
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
  

  

