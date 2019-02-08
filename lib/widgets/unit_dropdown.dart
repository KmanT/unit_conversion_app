import 'package:flutter/material.dart';
import '../models/unit_item.dart';

class UnitDropdown extends StatefulWidget {
  final List<UnitItem> _units;
  UnitItem _selectedUnit;
  Function _changeFunction;

  UnitDropdown(this._units, this._selectedUnit, this._changeFunction);

  UnitItem getSelectedUnit() {
    return _selectedUnit;
  }

  @override
  State<StatefulWidget> createState() {
    return UnitDropdownState(_units, _selectedUnit, _changeFunction);
  }
}

class UnitDropdownState extends State<UnitDropdown> {
  List<UnitItem> _units;
  UnitItem _selectedUnit;
  Function _changeFunction;
  UnitDropdownState(this._units, this._selectedUnit, this._changeFunction);

  @override
  void initState() {
    _selectedUnit = _units[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _selectedUnit,
      items: _buildButtonList(_units),
      onChanged: (UnitItem value) {
        _changedUnit(value);
        _changeFunction(value);
      }      
    );
  }

  List<Widget> _buildButtonList(List<UnitItem> list) {
    List<DropdownMenuItem<UnitItem>> buttonList = [];
    list.forEach((item) {
      buttonList.add(
        new DropdownMenuItem(
          value: item,
          child: Text(item.unitName),
        )
      );
    });
    return buttonList;
  }

  void _changedUnit(UnitItem item) {
    setState(() {
          _selectedUnit = item;
    });
  }

}