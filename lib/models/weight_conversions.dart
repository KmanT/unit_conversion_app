import 'package:decimal/decimal.dart';
import './unit.dart';
import './conversion_type.dart';

///Holds all of the static functions for weight conversions.
class WeightConversions {

  ///Used to create decimal values. Shortens typing.
  static final Function d = (String s) => Decimal.parse(s);
  
  ///Multiplier for converting pounds to kg
  static final Decimal _lbToKg = d("0.453592");
  ///Multiplier for converting kg to pounds
  static final Decimal _kgToLb = d("2.204623");

  ///Holds of the metric units which are converted to kilograms.
  static final Map<String, Decimal> _metric = {
    "mt": d("0.001"),
    "kg": d("1"),
    "g": d("1000"),
    "mg": d("1000000")
  };

  ///Holds all of the imperial units which are converted to pounds.
  static final Map<String, Decimal> _imperial = {
    "it": d("1") / d("2000"),
    "st": d("1") / d("14"),
    "lb": d("1"),
    "oz": d("16")
  };

  ///Calls the appropriate conversion functions. If the metrics (or units) are 
  ///the same, then this function will return the input. If the types are the 
  ///same (imperial or metric) then either the _imperialConversion or the 
  ///_metricConversion functions are called. Other wise, if the types are not
  ///equal then either _imperialToMetric or _metricToImperial will be called.
  static Decimal convert(Unit u) {
    if(u.inMetric != u.outMetric) {
      switch (u.inType) {
        case ConversionType.imperial:
          switch (u.outType) {
            case ConversionType.imperial:
              return _imperialConversion(u.amount, u.inMetric, u.outMetric);         
            case ConversionType.metric:
              return _imperialToMetric(u.amount, u.inMetric, u.outMetric);
            default: print("error");
          }
          break;
        case ConversionType.metric:
          switch (u.outType) {
            case ConversionType.imperial:
              return _metricToImperial(u.amount, u.inMetric, u.outMetric);            
              break;
            case ConversionType.metric:
              return _metricConversion(u.amount, u.inMetric, u.outMetric);
            default:
          }
          break;
        default: print("error");
      }
    }    
    return u.amount;
  }

  ///Converts imperial units to metric units.
  static Decimal _imperialToMetric(Decimal input, String inKey,
    String outKey) {
    //convert to lb
    Decimal result = input / _imperial[inKey];
    //convert to kg
    result *= _lbToKg;
    //convert to output
    return result *= _metric[outKey];
  }

  ///Converts metric units to imperial units.
  static Decimal _metricToImperial(Decimal input, String inKey,
    String outKey) {
    //convert to kg
    Decimal result = input / _metric[inKey];
    //convert to lb
    result *= _kgToLb;
    //convert to output
    return result *= _imperial[outKey];
  }

  ///Converts one imperial unit to another.
  static Decimal _imperialConversion(Decimal input, String inKey,
    String outKey) {
    Decimal result = input / _imperial[inKey];
    return result * _imperial[outKey];
  }

  ///Converts one metric unit to another.
  static Decimal _metricConversion(Decimal input, String inKey, String outKey) {
    Decimal result = input / _metric[inKey];
    return result * _metric[outKey];
  }
}
