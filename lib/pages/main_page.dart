//tabs for length, weight, temperature, and time
import 'package:flutter/material.dart';

import '../widgets/page_tabs.dart';
import './weight_page.dart';
import './length_page.dart';
import './temperature_page.dart';
import './time_page.dart';

class MainPage extends StatelessWidget {

  @override
    Widget build(BuildContext context) {
      return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('AbsolutUnit'),
            bottom: TabBar(
              tabs: PageTabs.buildPageTabs(),
            )
          ),
          body: TabBarView(
            children: <Widget>[
              WeightPage(),
              LengthPage(),
              TemperaturePage(),
              TimePage()
            ],
          ),
          //backgroundColor: //ColorData.background_black,
        )
      );
    }
}