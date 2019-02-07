import '../models/conversion_type.dart';
///Defined for use inside the dropdown buttons used for unit selection.
class UnitItem {
  ///The identifier used for the conversion functions
  String unitID = "";
  ///The string displayed inside of the dropdown buttons.
  String unitName = "";
  ///The unit type (imperial/metric) used for some of the conversion functions.
  ConversionType unitType = ConversionType.imperial;
  ///UnitItem constructor
  UnitItem(this.unitID, this.unitName, this.unitType);
}