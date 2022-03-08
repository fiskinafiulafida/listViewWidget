import 'package:flutter/material.dart';

class KonversiSuhu extends StatelessWidget {
  const KonversiSuhu({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              onPressed: () {
                onPressed();
              },
              child: Text('Konversi Suhu')),
        ),
      ],
    );
  }
}
