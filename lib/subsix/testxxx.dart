import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Testxxx extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Testxxx();
  }
}


int clicks = 0;

class _Testxxx extends State<Testxxx> {
TextEditingController _controller = TextEditingController();

TextEditingController _c ;
  
  String _text = "initial";

@override
  void initState() {
    super.initState();
    _controller.text = "0"; 
    _c =  TextEditingController();
  }


  void dispose(){
   _c?.dispose();
   super.dispose();
  }


@override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Number Field increment decrement'),
        ),
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
                                  height: 385,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4),
                                          topRight: Radius.circular(4),
                                          bottomLeft: Radius.circular(4),
                                          bottomRight: Radius.circular(4)),
                                      image: DecorationImage(
                                          image:
                                              AssetImage("assets/topview.jpg"),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ]),
                            Stack(children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      right: 10, left: 10, top: 427),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Record your data and reset to zero each time',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        SizedBox(height: 8.0),
                                        Container(
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                gradient: LinearGradient(
                                                  begin: FractionalOffset
                                                      .bottomLeft,
                                                  end:
                                                      FractionalOffset.topRight,
                                                  colors: <Color>[
                                                    Colors.green,
                                                    Colors.greenAccent
                                                  ],
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black26,
                                                      offset: Offset(2, 2))
                                                ]),
                                            height: 60,
                                            padding: EdgeInsets.only(
                                              left: 15.0,
                                              right: 15,
                                            ),
                                            child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Material(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    color: Colors.transparent,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(4.0),
                                                      child: Text(
                                                        'Matchs',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 19.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                      children: <Widget>[
                                                        SizedBox.fromSize(
                                                                        size: Size(40, 40),
                                                                        child: ClipOval(
                                                                            child: Material(
                                                                                color: Colors.transparent,
                                                                                child: InkWell(
                                                                                    splashColor: Colors.white,
                                                                                    onTap: () { },
                                                                                    child: Column(
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: <Widget>[
                                                                                        Icon(
                                                                                          Icons.add_circle,
                                                                                          size: 25,
                                                                                        ),
                                                                                      ],
                                                                                    ))))),
                                                        Container(
                                                            width: 150.0,
                                                            foregroundDecoration:BoxDecoration(
                                                              borderRadius:BorderRadius.circular(5.0),
                                                              border: Border.all(
                                                                color: Colors.blueGrey,
                                                                width: 2.0,
                                                              ),
                                                            ),
              child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,

                  child: TextFormField(
                    controller: _controller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: (){
                        _controller.clear();
                      },
                      icon: Icon(
                        Icons.keyboard,
                        color: Colors.red,
                      ),
                      ),
                      contentPadding: EdgeInsets.all(5.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: false,
                      signed: true,
                    ),
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    
                  ),


                ),
                Container(
                  height: 48.0,
                  width: 50,
                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 0.5,
                            ),
                          ),
                        ),
                        child: InkWell(
                          child: Icon(
                            Icons.arrow_drop_up,
                            size: 22.0,
                          ),
                          onTap: () {
                            int currentValue = int.parse(_controller.text);
                            setState(() {
                              currentValue++;
                              _controller.text = (currentValue)
                                  .toString(); // incrementing value
                            });
                          },
                        ),
                      ),
                      InkWell(
                        child: Icon(
                          Icons.arrow_drop_down,
                          size: 22.0,
                        ),
                        onTap: () {
                          int currentValue = int.parse(_controller.text);
                          setState(() {
                            print("Setting state");
                            currentValue--;
                            _controller.text =
                                (currentValue > 0 ? currentValue : 0)
                                    .toString();
                                                                            });
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ]))
                                                    
                                                ])
                                      ]))
                            ])
                          )
            ])]))))]));
            
  }
}