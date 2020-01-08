import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/crud/data/firestore_service.dart';
import 'package:flutter_ui_designs/crud/data/model/note.dart';
import 'package:flutter_ui_designs/crud/presentation/pages/add_note.dart';
import 'package:flutter_ui_designs/crud/presentation/pages/note_details.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black87,
            expandedHeight: 120.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Challenge Messeges",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: Container(
                decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage("assets/Challenge.jpg"),
                  fit: BoxFit.cover,
                )),
          ))),
        ];
      },
      body: StreamBuilder(
        stream: FirestoreService().getNotes(),
        builder: (BuildContext context, AsyncSnapshot<List<Note>> snapshot) {
          if (snapshot.hasError || !snapshot.hasData)
          return CircularProgressIndicator();  
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              Note note = snapshot.data[index];

              return Card(
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)),
                elevation: 5.0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    leading: CircleAvatar(
                      radius: 25.0,
                      backgroundImage: AssetImage("assets/default.png"),
                    ),
                    title: Row(
                      children: <Widget>[
                        Flexible(
                        child: Container(
                        padding: EdgeInsets.all(0),
                        child: Text(note.title,
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                        style: TextStyle(
                        fontFamily: 'Opensans',
                        fontSize: 16.0,
                        color: Colors.black87)),
                        )),
                        
                      ],
                    ),
                    subtitle:  
                      Row(
                      children: <Widget>[
                        Flexible(
                        child: Container(
                        padding: EdgeInsets.all(0),
                        child: Text(note.description,
                        overflow: TextOverflow.fade,
                        maxLines: 10,
                        style: TextStyle(
                        fontFamily: 'Opensans',
                        fontSize: 15.0,
                        color: Colors.black87)),
                        )),
                        
                      ],
                    ),
                      
                    trailing: 
                      Text(
                      note.date,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                    ),

                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NoteDetailsPage(
                          note: note,
                        ),
                      ),
                    ),
                  ),
                  ButtonTheme.bar(
                      child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text('Edit'),
                        textColor: Colors.green,
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AddNotePage(note: note),
                            )),
                      ),
                      FlatButton(
                        child: Text('Delete'),
                        textColor: Colors.red,
                        onPressed: () => _deleteNote(context, note.id),
                      ),
                    ],
                  )),
                ]),
              );
            },
          );
        },
      ),
      
    ),
    floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.chat),
          backgroundColor: Colors.green,
          label: Text("Create Message"),
          onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddNotePage()));
        },
      ),
    );
  }

  void _deleteNote(BuildContext context, String id) async {
    if (await _showConfirmationDialog(context)) {
      try {
        await FirestoreService().deleteNote(id);
      } catch (e) {
        print(e);
      }
    }
  }

  Future<bool> _showConfirmationDialog(BuildContext context) async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
              content: Text("Are you sure you want to delete?"),
              actions: <Widget>[
                FlatButton(
                  textColor: Colors.red,
                  child: Text("Delete"),
                  onPressed: () => Navigator.pop(context, true),
                ),
                FlatButton(
                  textColor: Colors.black,
                  child: Text("No"),
                  onPressed: () => Navigator.pop(context, false),
                ),
              ],
            ));
  }
}



