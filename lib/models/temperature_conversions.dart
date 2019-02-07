import 'package:decimal/decimal.dart';
import './unit.dart';

class TemperatureConversions {
  ///Used to create decimal values. Shortens typing.
  static final Function d = (String s) => Decimal.parse(s);

  static Decimal convert(Unit u) {
    if (u.inMetric != u.outMetric) {
      switch (u.inMetric) {
        case "F":
          switch (u.outMetric) {
            case "C":
              return _fToC(u.amount);
            case "K":
              return _fToK(u.amount);
            default:
              print("Error with output metric");
          }
          break;
        case "C":
          switch (u.outMetric) {
            case "F":
              return _cToF(u.amount);
            case "K":
              return _cToK(u.amount);
            default:
              print("Error with output metric");
          }
          break;
        case "K":
          switch (u.outMetric) {
            case "F":
              return _kToF(u.amount);
            case "C":
              return _kToC(u.amount);
            default: print("Error with output metric");
          }
          break;
        default: print("Error with input metric");
          
      }
    }
    return u.amount;
  }

  static Decimal _cToF(Decimal input) {
    return (input * (d("9") / d("5"))) + d("32");
  }

  static Decimal _fToC(Decimal input) {
    return (input - d("32")) * (d("5") / d("9"));
  }

  static Decimal _cToK(Decimal input) {
    return input + d("273.15");
  }

  static Decimal _kToC(Decimal input) {
    return input - d("273.15");
  }

  static Decimal _fToK(Decimal input) {
    return _cToK(_fToC(input));
  }

  static Decimal _kToF(Decimal input) {
    return _cToF(_kToC(input));
  }
}