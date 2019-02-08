import 'package:flutter/material.dart';
import '../widgets/conversion_page.dart';
import '../models/item_lists.dart';
import '../models/time_conversions.dart';


class TimePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConversionPage(ItemLists.timeUnits(), TimeConversions.convert);
  }
}
