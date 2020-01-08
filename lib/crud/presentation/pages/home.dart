import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/crud/data/firestore_service.dart';
import 'package:flutter_ui_designs/crud/data/model/note.dart';
import 'package:flutter_ui_designs/crud/presentation/pages/add_note.dart';
import 'package:flutter_ui_designs/crud/presentation/pages/note_details.dart';

enum PageEnum {
  firstPage,
  secondPage,
}


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
  elevation: 5.0,  
  child: Stack(
    children: [
    Padding(
    padding: EdgeInsets.all(10.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
      makeFeed( 
        userImage:'assets/Ton.jpg',
        ),
              
      SizedBox(width: 10,),  

      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
        Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        crossAxisAlignment:CrossAxisAlignment.start,
        children: <Widget>[
            Text(note.title,
            overflow: TextOverflow.fade,
            maxLines: 1,
            softWrap: false,
            style: TextStyle(
            fontFamily: 'Opensans',
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Colors.black)),

            SizedBox(height: 3,),
            
            
            Text(note.description,
            overflow: TextOverflow.fade,
            maxLines: 2,
            softWrap: false,
            style: TextStyle(
            fontFamily: 'Opensans',
            fontSize: 12.0,
            color: Colors.black)),
            
      ])]), 
        
      
       
      ]
    ),  
    
    
      Padding(
        padding: EdgeInsets.only(top: 0,),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
        Row(
        children: <Widget>[
        Chip(
        label: Text(note.date,
        style: TextStyle(
        fontFamily: 'Opensans',
        fontSize: 10.0,
        color: Colors.black87)
                ),
              ),
        FlatButton(
        child: Text('Details'),
        textColor: Colors.grey.withOpacity(0.8),
        onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NoteDetailsPage(
                          note: note,
                        ),
        ),      
        ),
        ),]),
        Row(
          children: <Widget>[
          IconButton(
          icon:  Icon(Icons.delete),
          color: Colors.red,
          tooltip: 'Delete',
          onPressed: () => _deleteNote(context, note.id),
          ),
            IconButton(
          icon:  Icon(Icons.update),
          color: Colors.green,
          tooltip: 'Edit',
          onPressed: () => Navigator.push(
               context, MaterialPageRoute(
               builder: (_) => AddNotePage(note: note),
         )),
        ),
        
        ]
        )
          ]
          )
        ),
    ],
    ),
    )]
    )
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
Widget makeFeed({userImage}) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              
              image: DecorationImage(
              image: AssetImage(userImage), fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 5,
        ),
        
      ]),
    );
  }

}



