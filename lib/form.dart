
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class TextFieldDemoPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _TextFieldDemoPageState();
}


class _TextFieldDemoPageState extends State<TextFieldDemoPage> {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    controller.addListener(() {
      print('input ${controller.text}');
    });
    return Scaffold(
        appBar: new AppBar(
            title: Text('Default app bar title'),
          actions: <Widget>[
            new IconButton(icon: const Icon(Icons.save), onPressed: () {})
          ],
          ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              // child: TextFieldBuilder.buildCustomTextField(controller),
              child: Column(
                children: TextFieldBuilder.buildDecorationTextField(controller),
              ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: FloatingActionButton.extended(
            onPressed: () {},
            label: Text("Save"),
            icon: Icon(Icons.save),
          )
        )
    );
  }
}
class TextFieldBuilder {
  static Widget buildBasicTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
    );
  }
  static Widget buildCustomTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      maxLength: 30,
      maxLines: 1,
      autocorrect: true,
      autofocus: true,
      obscureText: true,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 30.0, color: Colors.blue),
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      onChanged: (text) {
        print('change $text');
      },
      onSubmitted: (text) {
        print('submit $text');
      },
      enabled: true,
    );
  }
  static List<Widget> buildDecorationTextField(TextEditingController controller) {
    return <Widget>[
      TextField(
        decoration: InputDecoration(
            fillColor: Colors.blue.shade100,
            filled: true,
            helperText: 'Player Name',
            prefixIcon: Icon(Icons.person_pin),
            suffixText: 'Name'),
      ),

      SizedBox(height: 20),

      TextField(
        decoration: InputDecoration(
            fillColor: Colors.blue.shade100,
            filled: true,
            helperText: 'Nationality',
            prefixIcon: Icon(Icons.person_pin),
            suffixText: 'Country'),
      ),

      SizedBox(height: 20),


      TextField(
        decoration: InputDecoration(fillColor: Colors.blue.shade100, filled: true, labelText: 'Player Name'),
      ),

      SizedBox(height: 20),

      TextField(
        decoration: InputDecoration(fillColor: Colors.blue.shade100, filled: true, labelText: 'Team Name'),
      ),

      SizedBox(height: 20),

      TextField(
        controller: controller,
        decoration: InputDecoration(
            fillColor: Colors.blue.shade100,
            filled: true,
            helperText: 'help',
            prefixIcon: Icon(Icons.local_airport),
            suffixText: 'airport'),
      ),
      SizedBox(height: 20),

      TextField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Colors.red, width: 3.0, style: BorderStyle.solid)
            )),
      ),

      SizedBox(height: 20),
      Theme(
        data: new ThemeData(primaryColor: Colors.red, hintColor: Colors.blue),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide(color: Colors.red, width: 3.0, style: BorderStyle.solid)
              )
          ),
        ),
      ),
      SizedBox(height: 20),

      Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        height: 60.0,
        decoration: new BoxDecoration(
            color: Colors.blueGrey,
            border: new Border.all(color: Colors.black54, width: 4.0),
            borderRadius: new BorderRadius.circular(12.0)
        ),
        child: new TextFormField(
          controller: controller,
          decoration: InputDecoration.collapsed(hintText: 'hello'),
        ),
      )
    ];
  }
}