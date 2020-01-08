import 'package:flutter/material.dart';



class DemoScreens extends StatefulWidget {
  @override
  _DemoScreensState createState() => new _DemoScreensState();
}

class _DemoScreensState extends State<DemoScreens> {


@override
Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: DecoratedBox(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("your_image_here"), fit: BoxFit.cover)),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 280,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Container(
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("your_image_here"), fit: BoxFit.cover)),
                  padding: EdgeInsets.only(top: 12, left: 24, right: 24, bottom: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {},
                            color: Colors.white,
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.more_vert),
                            onPressed: () {},
                            color: Colors.white,
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(color: Colors.white, width: 100, height: 100),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                _myText("ทีมไหน FC", 16),
                                _myText("25 Member", 14),
                                SizedBox(height: 6),
                                _myText("Martial status", 16),
                                _myText("Unmarried", 14),
                                SizedBox(height: 6),
                                Container(padding: EdgeInsets.all(4), color: Colors.blue, child: _myText("PLUS PLAN - 1 DAY LEFT", 12)),
                                SizedBox(height: 12),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 150,
                        child: OutlineButton(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                          onPressed: () {},
                          child: _myText("CHANGE PLAN", 16),
                        ),
                      ),
                      Text(
                        "Higher plans give you more connects",
                        style: TextStyle(fontSize: 10, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(30),
                          right: Radius.circular(30),
                        )),
                    child: Column(
                      children: <Widget>[
                        _buildCard1(),
                        _buildCard2(),
                        _buildCard2(),
                        _buildCard2(),
                        
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _myText(String data, double size) => Text(data, style: TextStyle(fontSize: size, color: Colors.white));

  Widget _buildCard1() {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("PROFILE DETAILS"),
          ),
          Placeholder(fallbackHeight: 200),
          Divider(),
          SizedBox(
            width: double.maxFinite,
            child: FlatButton(
              onPressed: () {},
              child: Text("UPDATE MY PROFILE"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard2() {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("PROFILE DETAILS"),
          ),
          Placeholder(fallbackHeight: 200),
          Divider(),
          SizedBox(
            width: double.maxFinite,
            child: FlatButton(
              onPressed: () {},
              child: Text("UPDATE MY PROFILE"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard() {
  return Card(
     
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    elevation: 5.0,
    child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      const ListTile(
        leading: CircleAvatar(
          radius: 25.0,
          backgroundImage: AssetImage("assets/Ton.jpg"),
        ),
        title: Text('Ekachai Ton'),
        subtitle: Text('Age 39, Height 183, Weight 80'),
      ),
    ]),
  );
}
}