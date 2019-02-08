import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import '../presentation/theme_data.dart';
import '../presentation/color_data.dart';
import '../widgets/unit_dropdown.dart';
import '../models/unit_item.dart';
import '../models/unit.dart';


///The weight unit conversion page.
class ConversionPage extends StatefulWidget {
  final List<UnitItem> _unitList;
  final Function _unitConversionFunction;

  ConversionPage(this._unitList, this._unitConversionFunction);

  @override
  State<StatefulWidget> createState() {
    return _ConversionPageState(_unitList, _unitConversionFunction);
  }
}

///The state for the weight unit conversion page
class _ConversionPageState extends State<ConversionPage> {
  static final Function d = (String s) => Decimal.parse(s);
  final List<UnitItem> _conversionUnits;
  final Function _unitConversionFunction;
  UnitItem inUnit;
  UnitItem outUnit;

  _ConversionPageState(this._conversionUnits, this._unitConversionFunction)
    : inUnit = _conversionUnits[0],
      outUnit = _conversionUnits[0];

  Decimal amount = d("0");
  
  String _output = "";
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  ///Builds the input amount for the unit conversion page.
  Widget _buildInput() {
    return Container(
      child: Form(
        key: _key,
        child:  TextFormField(
          style: TextStyle(color: ColorData.background_black),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Conversion Amount",
            labelStyle: TextStyle(
              color: ColorData.background_black
            )),
          validator: (String value) {
            if (value.isEmpty || 
              !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
              return 'The input amount should numeric';
            }
          },
          onSaved: (String value) {
            setState(() {
              amount = d(value);
            });            
          }
        ),
      )
     ,
      decoration: BoxDecoration(
        color:ColorData.off_white,
      ),
    );
  }

  ///Builds the two drop buttons that contain the units to select.
  Widget _buildUnitSelector() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          UnitDropdown(_conversionUnits, inUnit, _changeInUnit),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text("=", style: MainThemeData.getTextStyle()),
          ),
          UnitDropdown(_conversionUnits, outUnit, _changeOutUnit)
        ],
      ),
      decoration: BoxDecoration(
        color: ColorData.coral
      ),
    );
    
  }

  void _changeInUnit(UnitItem newItem) {
    inUnit = newItem;
  }

  void _changeOutUnit(UnitItem newItem) {
    outUnit = newItem;
  }

  Widget _buildConvertButton() {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          RaisedButton(
            color: ColorData.light_indigo,
            child: Text("Convert!"),
            onPressed: _submitInfo,
          )
        ],
      ),
    );
  }

  void _submitInfo() {
    if(!_key.currentState.validate()) {
      return;
    }
    _key.currentState.save();
    Unit newUnit = new Unit(
      amount, inUnit.unitID, inUnit.unitType,
      outUnit.unitID, outUnit.unitType
    );
    print(newUnit.toString());
    print(_unitConversionFunction(newUnit));
    _output = _unitConversionFunction(newUnit).toString() + newUnit.outMetric;
  }

  Widget _buildOutput() {
    return Container(
      child: Text(
        _output,
        style: TextStyle(
          color: ColorData.coral,
          fontSize: 24,
          fontWeight: FontWeight.w700
          ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildInput(),
            SizedBox(height: 10,),
            _buildUnitSelector(),
            SizedBox(height: 10,),
            _buildConvertButton(),
            _buildOutput()
          ],
        ),
        decoration: BoxDecoration(
          color: ColorData.background_black
        ),
      );
  }
}