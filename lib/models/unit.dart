import 'package:decimal/decimal.dart';
import './conversion_type.dart';
///The container that holds all of the information needed to make unit
///conversions.
class Unit {
  ///The amount to be converted.  
  final Decimal amount;
  ///The unit of measure the unit starts as.
  final String inMetric;
  ///Determines if the unit starts as metric or imperial.
  final ConversionType inType;
  ///The unit of measure that unit converts to.
  final String outMetric;
  ///Determines if the unit finishes as metric or imperial.
  final ConversionType outType;

  ///Unit constructor
  Unit(this.amount, this.inMetric, this.inType, this.outMetric, this.outType);

  ///Puts all of the unit information in a string. Used to print output for
  ///testing.
  @override
  String toString() {
    return this.amount.toString() + this.inMetric.toString()
      + this.inType.toString() + this.outMetric.toString()
      + this.outType.toString();
  }
}