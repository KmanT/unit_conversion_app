import 'package:flutter/material.dart';
import '../widgets/conversion_page.dart';
import '../models/item_lists.dart';
import '../models/weight_conversions.dart';


class WeightPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConversionPage(ItemLists.weightUnits(), WeightConversions.convert);
  }
}
