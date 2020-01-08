import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_designs/joinbar/myappbar.dart';
import 'package:flutter_ui_designs/joinbar/myflexiableappbar.dart';



class JoinsTeam extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _JoinsTeam();
  }
}

enum MyDialogAction { yes, no, }

void _dialogResult(MyDialogAction value) {
  print('You selected $value');
}

class _JoinsTeam extends State<JoinsTeam> {
  AlertDialog dialog =  AlertDialog(
    content:  Text(
      "Confirm to join the team?",
      style:  TextStyle(fontSize: 20.0),),
    actions: <Widget>[
       FlatButton(onPressed: (){_dialogResult(MyDialogAction.yes);}, child:  Text('Yes'), color: Colors.green, textColor: Colors.white),
       FlatButton(onPressed: (){_dialogResult(MyDialogAction.no);}, child:  Text('No'), color: Colors.red, textColor: Colors.white),
    ],
  );

  AlertDialog dialogs =  AlertDialog(
    content:  Text(
      "Do you want to cancel?",
      style:  TextStyle(fontSize: 20.0),),
    actions: <Widget>[
       FlatButton(onPressed: (){_dialogResult(MyDialogAction.yes);}, child:  Text('Yes'), color: Colors.green, textColor: Colors.white),
       FlatButton(onPressed: (){_dialogResult(MyDialogAction.no);}, child:  Text('No'), color: Colors.red, textColor: Colors.white),
    ],
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        title: MyAppBar(),
        pinned: true,
        expandedHeight: 210.0,
        backgroundColor: Colors.black87.withBlue(7),
        flexibleSpace: FlexibleSpaceBar(
          background: MyFlexiableAppBar(),
        ),
      ),
      SliverList(
          delegate: SliverChildListDelegate([
        Column(children: <Widget>[
          _buildCard(),
           _buildCard(),
            _buildCard(),
             _buildCard(),
              _buildCard(),
               _buildCard(),
                _buildCard(),
          
        ])
        
      ]
      )
      ),
      
      ]
    )
    );
  }
}

Widget _buildCard() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
    elevation: 5.0,
    child: Column(mainAxisSize: MainAxisSize.min, 
    children: <Widget>[
      const ListTile(
        leading: CircleAvatar(
          radius: 25.0,
          backgroundImage: AssetImage("assets/Ton.jpg"),
        ),
        title: Text('Ekachai Ton'),
        subtitle: Text('Midfielder, Right Foot, No.10'), 
        trailing: Text('Age 39'),
      ),
      ButtonTheme.bar( 
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                          child:  Text('Accept'),
                          textColor: Colors.green,
                          onPressed: () {}
                      ),
                      FlatButton(
                          child:  Text('Cancel'),
                          textColor: Colors.red,
                          onPressed: () {}
                      ),
                    ],
                  )
              ),
     
    ]),
  );
}

Widget _listDetail() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 10, 5),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Text('WANT TO JOIN THE TEAM?'),
              ),
              Container(
                child: RaisedButton(
                  color: Colors.greenAccent,
                  child: Text(
                    'Join',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              )
            ]),
      );
    }
