import 'package:decimal/decimal.dart';
import './unit.dart';
import './conversion_type.dart';

///Holds all of the static functions for making colume conversions
class VolumeConversions {

  ///Used to create decimal values. Shortens typing.
  static final Function d = (String s) => Decimal.parse(s);
  
  ///Multiplier for converting pounds to kg
  static final Decimal _lbToKg = d("0.453592");
  ///Multiplier for converting kg to pounds
  static final Decimal _kgToLb = d("2.204623");

  ///Holds of the metric units which are converted to kilograms.
  static final Map<String, Decimal> _metric = {
    
  };

  ///Holds all of the imperial units which are converted to pounds.
  static final Map<String, Decimal> _imperial = {
    "ugl": d(""),
    "cup": d("1"),
    "foz": d("8"),
    "tbs": d("16"),
    "tsp": d("48")
  };
}