import 'package:decimal/decimal.dart';
import './unit.dart';
import './conversion_type.dart';

class LengthConversions {
  ///Used to create decimal values. Shortens typing.
  static final Function d = (String s) => Decimal.parse(s);
  ///Multiplier for converting yards to meters.
  static final Decimal _ydToM = d("0.9144");
  ///Multiplier for converting meters to yards.
  static final Decimal _mToYd = d("1.093613");

  ///Holds of the metric units which are converted to meters.
  static final Map<String, Decimal> _metric = {
    "km": d("0.001"),
    "m_": d("1"),
    "cm": d("100"),
    "mm": d("1000")
  };

  ///Holds all of the imperial units which are converted to feet.
  static final Map<String, Decimal> _imperial = {
    "mi": d("1") / d("1760"),
    "yd": d("1"),
    "ft": d("3"),
    "in": d("36")
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
    return null;
  }

  static Decimal _imperialToMetric(Decimal input, String inKey,
    String outKey) {
    //convert to lb
    Decimal result = input / _imperial[inKey];
    //convert to kg
    result *= _ydToM;
    //convert to output
    return result *= _metric[outKey];
  }

  static Decimal _metricToImperial(Decimal input, String inKey,
    String outKey) {
    //convert to kg
    Decimal result = input / _metric[inKey];
    //convert to lb
    result *= _mToYd;
    //convert to output
    return result *= _imperial[outKey];
  }

  static Decimal _imperialConversion(Decimal input, String inKey,
    String outKey) {
    Decimal result = input / _imperial[inKey];
    return result * _imperial[outKey];
  }

  static Decimal _metricConversion(Decimal input, String inKey, String outKey) {
    Decimal result = input / _metric[inKey];
    return result * _metric[outKey];
  }
}