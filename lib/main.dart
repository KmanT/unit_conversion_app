import 'package:flutter/material.dart';
import './presentation/theme_data.dart';
import './models/unit_item.dart';

import './pages/main_page.dart';
void main() => runApp(MyApp());

///Main App
class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

///State for the Main App
class _MyAppState extends State<MyApp> {
  /// Build function for creating the main app. Set the 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AbsolutUnit',
      theme: MainThemeData.getThemeData(),
      routes: {
        '/': (BuildContext context) => MainPage()
      }
    );
  }

}