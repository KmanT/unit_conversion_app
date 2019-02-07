import './unit_item.dart';
import './conversion_type.dart';
///The list of all the conversion types in order to build the dropdown buttons
///on the conversion pages.
class ItemLists {
  ///The list of weight units used for the dropdowns on the weight page.
  static List<UnitItem> weightUnits() {
    return [
      new UnitItem("kg", "Kilogram", ConversionType.metric),
      new UnitItem("lb", "Pound", ConversionType.imperial),
      new UnitItem("g", "Gram", ConversionType.metric),
      new UnitItem("oz", "Ounce", ConversionType.imperial),
      new UnitItem("mg", "Miligram", ConversionType.metric),
      new UnitItem("mt", "Metric Ton", ConversionType.metric),
      new UnitItem("st", "Stone", ConversionType.imperial),
      new UnitItem("it", "Imperial Ton", ConversionType.imperial),
    ];
  }

  ///The list of length units used for the dropdowns on the length page.
  static List<UnitItem> lengthUnits() {
    return [
      UnitItem("mm", "Milimeter", ConversionType.metric),
      UnitItem("in", "Inch", ConversionType.imperial),
      UnitItem("cm", "Centimeter", ConversionType.metric),
      UnitItem("ft", "Foot", ConversionType.imperial),
      UnitItem("m_", "Meter", ConversionType.metric),
      UnitItem("yd", "Yard", ConversionType.imperial),
      UnitItem("km", "Kilometer", ConversionType.metric),
      UnitItem("mi", "Mile", ConversionType.imperial),
    ];
  }

  ///The list of temperature units used for the dropdowns on the temeperature
  ///page.
  static List<UnitItem> tempUnits() {
    return [
      UnitItem("C", "Celcius", ConversionType.metric),
      UnitItem("K", "Kelvin", ConversionType.metric),
      UnitItem("F", "Fahrenheit", ConversionType.metric),
    ];
  }

  ///The list of time units used for the dropdowns on the time page.
  static List<UnitItem> timeUnits() {
    return [
      UnitItem("sec", "Second", ConversionType.metric),
      UnitItem("min", "Minute", ConversionType.metric),
      UnitItem("hr_", "Hour", ConversionType.metric),
      UnitItem("day", "Day", ConversionType.metric),
      UnitItem("wk_", "Week", ConversionType.metric),
      UnitItem("mon", "Month", ConversionType.metric),
      UnitItem("yr_", "Year", ConversionType.metric),
      UnitItem("cty", "Century", ConversionType.metric),
    ];
  }
}