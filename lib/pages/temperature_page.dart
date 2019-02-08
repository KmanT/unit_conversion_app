import 'package:flutter/material.dart';
import '../widgets/conversion_page.dart';
import '../models/item_lists.dart';
import '../models/temperature_conversions.dart';


class TemperaturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConversionPage(ItemLists.tempUnits(), TemperatureConversions.convert);
  }
}
