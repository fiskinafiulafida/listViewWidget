import 'package:flutter/material.dart';

class targetPerhitungan extends StatelessWidget {
  const targetPerhitungan({
    Key? key,
    required this.selectDropdown,
    required this.listSatuanSuhu,
    required this.onDropdownChanged,
  }) : super(key: key);

  final String selectDropdown;
  final List<String> listSatuanSuhu;
  final Function onDropdownChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        isExpanded: true,
        value: selectDropdown,
        items: listSatuanSuhu.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          onDropdownChanged(value);
        });
  }
}
