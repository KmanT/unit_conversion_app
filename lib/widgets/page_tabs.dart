import 'package:flutter/material.dart';
import '../presentation/tab_icons_icons.dart';

class PageTabs{

  static List<Widget> buildPageTabs() {
    return <Widget>[
      Tab(
        icon: Icon(TabIcons.balance_scale),
        text: 'Weight'
      ),
      Tab(
        icon: Icon(TabIcons.ruler),
        text: 'Length'
      ),
      Tab(
        icon: Icon(TabIcons.temperature),
        text: 'Temp'
      ),
      Tab(
        icon: Icon(TabIcons.timer),
        text: 'Time'
      )
    ];
  }
}