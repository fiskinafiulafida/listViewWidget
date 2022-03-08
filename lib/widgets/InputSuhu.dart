import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputSuhu extends StatelessWidget {
  const InputSuhu({
    Key? key,
    required this.Input,
  }) : super(key: key);

  final TextEditingController Input;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: Input,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: "Celcius", hintText: "Masukan Suhu Celcius"),
      // onChanged: (value) {},
    );
  }
}
