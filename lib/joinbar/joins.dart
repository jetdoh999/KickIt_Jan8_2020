import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_designs/log/model/memberModel.dart';

class Joins extends StatefulWidget {
  //////////////////////////////
  //ตั้งให้มีการรับค่าสำหรับทีมที่ถูกเลือกมาแสดง
  final String teamID;
  Joins({Key key, @required this.teamID}) : super(key: key);
  //////////////////////////////
  @override
  State<StatefulWidget> createState() {
    return _Joins();
  }
}

enum MyDialogAction { yes, no }

void _dialogResult(MyDialogAction value) {
  print('You selected $value');
}

class _Joins extends State<Joins> {
  //////////////////////////////
  String uidLogin; //เก็บค่า userID
  List<Member> requestList = List<Member>(); //เก็บค่า รายชื่อคนรีเควสขอเข้าทีม

  //ค้นหาไอดีของผู้ใช่้งาน
  Future<void> findUID() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth.currentUser().then((object) {
      uidLogin = object.uid;
    });
  }

  //ดึงข้อมูลของผู้เล่นจาก UserID เพื่อเก็บลงในrequestList
  getMemberUser(String uid) {
    Firestore firestore = Firestore.instance;
    var result;
    CollectionReference collectionReference = firestore.collection('User');
    collectionReference
        .document(uid)
        .snapshots()
        .listen((DocumentSnapshot documentSnapshot) {
      result = documentSnapshot.data;
      //ดึงค่าของผู้เล่นจาก firestore ใน table User

      setState(() {
        requestList.add(Member(
            uid: uid,
            name: result['profileName'],
            age: result['age'],
            position: result['position'],
            no: result['shirtNumber']));
      });
    });
  }

  //ดึงข้อมูล userID ของผู้เล่นที่ทำการรีเควสมาเข้าทีม
  getRequestList() {
    requestList.clear();

    CollectionReference collectionReference =
        Firestore.instance.collection('Team');

    collectionReference
        .document(widget.teamID)
        .snapshots()
        .listen((DocumentSnapshot documentSnapshot) {
      for (var i = 0; i < documentSnapshot.data['requestMember'].length; i++) {
        //นำข้อมูลที่ได้ไปค้นหาข้อมูลเพิ่มเพื่อจัดเก็บเป็น object
        getMemberUser(documentSnapshot.data['requestMember'][i]);
      }
    });
  }

  //Functionทำการลบข้อมูลของ requestlist เมื่อทำการ ตกลง หรือ ปฏิเสธและ อัพเดตไปยังfirestore
  removeRequestList(Member member) {
    //สร้างตัวแปรชั่วคราวเพื่อเก็บค่าเป็น String สำหรับUserID

    var val = []; //blank list for add elements which you want to delete
    val.add('${member.uid}');

    Firestore.instance
        .collection("Team")
        .document(widget.teamID)
        .updateData({"requestMember": FieldValue.arrayRemove(val)});

    setState(() {
      requestList.removeWhere((f) => f.uid == member.uid);
    });
  }

  //Functionเพิ่มข้อมูลคนที่ได้รับการเข้าร่วมลงใน firestore
  addMemberTeam(String uid) {
    //สร้างตัวแปรสำหรับเก็บค่า uid คนที่ได้รับการตอบรับ
    var list = List<String>();
    list.add(uid);

    //บันทึกลงfirestore table Team variable MemberTeam
    Firestore.instance
        .collection('Team')
        .document(widget.teamID)
        .updateData({"MemberTeam": FieldValue.arrayUnion(list)});
  }
  //////////////////////////////

  AlertDialog dialog = AlertDialog(
    content:
        Text("Confirm to join the team?", style: TextStyle(fontSize: 20.0)),
    actions: <Widget>[
      FlatButton(
          onPressed: () {
            _dialogResult(MyDialogAction.yes);
          },
          child: Text('Yes'),
          color: Colors.green,
          textColor: Colors.white),
      FlatButton(
          onPressed: () {
            _dialogResult(MyDialogAction.no);
          },
          child: Text('No'),
          color: Colors.red,
          textColor: Colors.white),
    ],
  );

  AlertDialog dialogs = AlertDialog(
    content: Text(
      "Do you want to cancel?",
      style: TextStyle(fontSize: 20.0),
    ),
    actions: <Widget>[
      FlatButton(
          onPressed: () {
            _dialogResult(MyDialogAction.yes);
          },
          child: Text('Yes'),
          color: Colors.green,
          textColor: Colors.white),
      FlatButton(
          onPressed: () {
            _dialogResult(MyDialogAction.no);
          },
          child: Text('No'),
          color: Colors.red,
          textColor: Colors.white),
    ],
  );

  @override
  void initState() {
    //////////////////////////////
    requestList.clear(); //clear request ก่อนเพื่อไม่ให้มีค่าตกค้าง
    getRequestList(); //ดึงค่ารีเควสใหม่
    //////////////////////////////
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    //////////////////////////////
    //ประกาศตัวแปรสำหรับเก็บค่าขนาดหน้าจอของอุปกรณ์ที่กำลังใช้งานอยู่
    double screenWidth = queryData.size.width;
    double screenHeight = queryData.size.height;

    //สร้างWidgetแยกสำหรับแสดงรายชือคนที่ขอrequestเข้ามา
    Widget requestListResult() {
      return ListView.builder(
          itemCount: requestList.length,
          itemBuilder: (BuildContext context, int index) {
            var item = requestList[index];

            return Container(
                height: 145,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  elevation: 5.0,
                  child:
                      Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    ListTile(
                        leading: CircleAvatar(
                            radius: 25.0,
                            backgroundImage: AssetImage("assets/Ton.jpg")),
                        title: Text(item.name),
                        subtitle: Text('${item.position}, No.${item.no}'),
                        trailing: Text('Age ${item.age}')),
                    ButtonTheme.bar(
                        child: ButtonBar(children: <Widget>[
                      FlatButton(
                          child: Text('Accept'),
                          textColor: Colors.green,
                          onPressed: () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => CupertinoAlertDialog(
                                        content: Text("Add User",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w600)),
                                        actions: [
                                          CupertinoDialogAction(
                                              child: Text('ok'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                                //ลบข้อมูลจากrequestList
                                                removeRequestList(item);
                                                //เพิ่มข้อมูลไปยังmemberList
                                                addMemberTeam(item.uid);
                                              })
                                        ]));
                          }),
                      FlatButton(
                          child: Text('Cancel'),
                          textColor: Colors.red,
                          onPressed: () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => CupertinoAlertDialog(
                                        content: Text("Cancel",
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w600)),
                                        actions: [
                                          CupertinoDialogAction(
                                              child: Text('yes'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                                //ลบข้อมูลจากrequestList
                                                removeRequestList(item);
                                              }),
                                          CupertinoDialogAction(
                                              child: Text('no'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              })
                                        ]));
                          })
                    ])),
                  ]),
                ));
          });
    }

    return Container(
        width: screenWidth,
        height: screenHeight * 0.85,
        child: requestListResult());
  }
}
