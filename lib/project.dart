import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:async';


class ProjectList extends StatelessWidget {
  ProjectList({this.firestore});

  final Firestore firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('projects').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return const Text('Loading...');
        //final int projectsCount = snapshot.data.documents.length;
        List<DocumentSnapshot> documents = snapshot.data.documents;
        return ExpansionTileList(
          firestore: firestore,
          documents: documents,
        );
      },
    );
  }
}

class ExpansionTileList extends StatelessWidget {
  final List<DocumentSnapshot> documents;
  final Firestore firestore;

  ExpansionTileList({this.documents, this.firestore});

  List<Widget> _getChildren() {
    List<Widget> children = [];
    documents.forEach((doc) {
      children.add(
        ProjectsExpansionTile(
          name: doc['name'],
          projectKey: doc.documentID,
          firestore: firestore,
        ),
      );
    });
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _getChildren(),
    );
  }
}

class ProjectsExpansionTile extends StatelessWidget {
  ProjectsExpansionTile({this.projectKey, this.name, this.firestore});

  final String projectKey;
  final String name;
  final Firestore firestore;

  @override
  Widget build(BuildContext context) {
    PageStorageKey _projectKey = PageStorageKey('$projectKey');

    return ExpansionTile(
      key: _projectKey,
      title: Text(
        name,
        style: TextStyle(fontSize: 28.0),
      ),
      children: <Widget>[
        StreamBuilder(
            stream: firestore
                .collection('projects')
                .document(projectKey)
                .collection('surveys')

                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return const Text('Loading...');
              //final int surveysCount = snapshot.data.documents.length;
              List<DocumentSnapshot> documents = snapshot.data.documents;

              List<Widget> surveysList = [];
              documents.forEach((doc) {
                PageStorageKey _surveyKey =
                     PageStorageKey('${doc.documentID}');

                surveysList.add(ListTile(
                  key: _surveyKey,
                  title: Text(doc['surveyName']),
                ));
              });
              return Column(children: surveysList);
            })
      ],
    );
  }
}