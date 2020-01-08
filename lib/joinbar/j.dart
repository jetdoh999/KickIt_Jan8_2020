import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Joins extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Joins();
  }
}

enum MyDialogAction { yes, no, }

void _dialogResult(MyDialogAction value) {
  print('You selected $value');
}

class _Joins extends State<Joins> {

  AlertDialog dialog = new AlertDialog(
    content: new Text(
      "Confirm to join the team?",
      style: new TextStyle(fontSize: 20.0),),
    actions: <Widget>[
      new FlatButton(onPressed: (){_dialogResult(MyDialogAction.yes);}, child: new Text('Yes'), color: Colors.green, textColor: Colors.white),
      new FlatButton(onPressed: (){_dialogResult(MyDialogAction.no);}, child: new Text('No'), color: Colors.red, textColor: Colors.white),
    ],
  );

  AlertDialog dialogs = new AlertDialog(
    content: new Text(
      "Do you want to cancel?",
      style: new TextStyle(fontSize: 20.0),),
    actions: <Widget>[
      new FlatButton(onPressed: (){_dialogResult(MyDialogAction.yes);}, child: new Text('Yes'), color: Colors.green, textColor: Colors.white),
      new FlatButton(onPressed: (){_dialogResult(MyDialogAction.no);}, child: new Text('No'), color: Colors.red, textColor: Colors.white),
    ],
  );


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 5.0,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage("assets/Ton.jpg"),
              ),

              title: Text('Ekachai Ton'),
              subtitle: Text('Age 39, Height 183, Weight 80'),
            ),

            ButtonTheme
                .bar( // make buttons use the appropriate styles for cards
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                        child: new Text('Accept'),
                        textColor: Colors.green,
                        onPressed: () {showDialog(context: context, child: dialog);}
                    ),
                    FlatButton(
                        child: new Text('Cancel'),
                        textColor: Colors.red,
                        onPressed: () {showDialog(context: context, child: dialogs);}
                    ),
                  ],
                )
            ),
          ]
      ),
    );
  }
}