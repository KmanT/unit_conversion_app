import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import '../presentation/theme_data.dart';
import '../presentation/color_data.dart';
import '../widgets/unit_dropdown.dart';
import '../models/item_lists.dart';
import '../models/unit_item.dart';
import '../models/unit.dart';
import '../models/weight_conversions.dart';

///The weight unit conversion page.
class WeightPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WeightPageState();
  }
}

///The state for the weight unit conversion page
class _WeightPageState extends State<WeightPage> {
  static final Function d = (String s) => Decimal.parse(s);
  static final List<UnitItem> _weightUnits = ItemLists.weightUnits();
  Decimal amount = d("0");
  UnitItem inUnit = _weightUnits[0];
  UnitItem outUnit = _weightUnits[1];
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
          UnitDropdown(_weightUnits, inUnit, _changeInUnit),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text("=", style: MainThemeData.getTextStyle()),
          ),
          UnitDropdown(_weightUnits, outUnit, _changeOutUnit)
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
    print(WeightConversions.convert(newUnit));
    _output = WeightConversions.convert(newUnit).toString() + newUnit.outMetric;
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