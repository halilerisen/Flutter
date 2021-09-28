import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haloagenda/constans.dart';

class CustomDropdownMenu extends StatelessWidget {
  final List<String> items;
  final Icon prefixIcon;
  final Function onChangedFunction;
  final String selectedValue;

  CustomDropdownMenu({
    @required this.items,
    @required this.onChangedFunction,
    @required this.selectedValue,
    this.prefixIcon,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.0),
        ),
        padding: EdgeInsets.only(
          left: 15,
          right: 8.0,
          top: 5.0,
          bottom: 5.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            prefixIcon ?? Text(''),
            DropdownButton<String>(
              value: selectedValue,
              dropdownColor: Colors.white,
              icon: Icon(
                Icons.arrow_drop_down_circle,
                color: kAppPrimaryColor,
                size: 24.0,
              ),
              isDense: true,
              elevation: 16,
              underline: Container(
                height: 0,
                color: Colors.black,
              ),
              onChanged: onChangedFunction,
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    textAlign: TextAlign.end,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 14.0,
                      letterSpacing: 1,
                      color: kAppPrimaryColor,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
