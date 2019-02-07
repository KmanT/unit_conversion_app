import 'package:flutter/material.dart';
import './color_data.dart';

///Defines the theme data for the application
class MainThemeData {

  
  ///creates 
  static final ThemeData _mainThemeData = ThemeData(
    primarySwatch: Colors.indigo,
    primaryColor: ColorData.neon_blue,
    brightness: Brightness.dark,
    accentColor: ColorData.coral,
    buttonColor: ColorData.coral,
    backgroundColor: ColorData.background_black
    //fontFamily: 'OpenSans'
  );

  static final TextStyle _textStyle = TextStyle(
    fontSize: 20
  );

  static TextStyle getTextStyle() {
    return _textStyle;
  }

  static ThemeData getThemeData() {
    return _mainThemeData;
  }
}