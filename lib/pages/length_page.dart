import 'package:flutter/material.dart';
import '../widgets/conversion_page.dart';
import '../models/item_lists.dart';
import '../models/length_conversions.dart';


class LengthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConversionPage(ItemLists.lengthUnits(), LengthConversions.convert);
  }
}
