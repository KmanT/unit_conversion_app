import 'package:decimal/decimal.dart';
import './unit.dart';

class TimeConversions {
  ///Used to create decimal values. Shortens typing.
  static final Function d = (String s) => Decimal.parse(s);

  ///Defines the multipliers for time measurement with a day as the unit of 1.
  static final Map<String, Decimal> _timeUnits = {
    "cty": d("1") / d("36524.2199"),
    "yr_": d("1") / d("365"),
    "mon": d("1") / d("30"),
    "wk_": d("1") / d("7"),
    "day": d("1"),
    "hr_": d("24"),
    "min": d("1440"),
    "sec":  d("86400"),
  };

  ///Converts a time measurement. If the in metric is the same as the out 
  ///metric, then the amount held in the unit will be returned. Otherwise, the 
  ///unit will first be converted to a day, then it will be converted into the
  /// desired unit of measurement.
  static Decimal convert(Unit u) {
    if(u.inMetric != u.outMetric) {
      Decimal result = u.amount / _timeUnits[u.inMetric];
      return result * _timeUnits[u.outMetric];
    }
    return u.amount;
  }
}