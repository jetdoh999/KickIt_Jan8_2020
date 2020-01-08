import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_ui_designs/cal/generated/i18n.dart';
import 'package:flutter_ui_designs/cal/service/storage_service.dart';
import 'package:flutter_ui_designs/cal/widget/cut_corners_border.dart';
import 'package:flutter_ui_designs/cal/widget/main_page.dart';


void main() async {
  StorageService storageService =  StorageService();
  await storageService.open();
  runApp( MyApp(databaseService: storageService));
}
  


class MyApp extends StatelessWidget {
  final StorageService databaseService;

  const MyApp({Key key, this.databaseService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stats',
      supportedLocales: [
        const Locale('en', ''),
        const Locale('pl', ''),
      ],
      localizationsDelegates: [
         GeneratedLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme:  ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border:  CutCornersBorder(),
        ),
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
        accentColor: Colors.green,
        errorColor: Color.fromRGBO(255, 153, 153, 1),
      ),
      home:  MainPage(storageService: databaseService),
    );
  }
}
