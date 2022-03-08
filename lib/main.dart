import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:js4_statefulmap/widgets/InputSuhu.dart';
import 'package:js4_statefulmap/widgets/KonversiSuhu.dart';
import 'package:js4_statefulmap/widgets/PerhitunganTerakhir.dart';
import 'package:js4_statefulmap/widgets/RiwayatPerhitungan.dart';
import 'package:js4_statefulmap/widgets/TargetPerhitungan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController Input = TextEditingController();
  List<String> listSatuanSuhu = ["Kelvin", "Reamur", "Fahrenheit"];
  String selectDropdown = "Kelvin";
  double hasilPerhitungan = 0.0;
  List<String> listHasil = [];

  void onDropdownChange(Object? value) {
    setState(() {
      selectDropdown = value.toString();
    });
  }

  void konversiSuhu() {
    setState(() {
      // hasilPerhitungan = 100;
      if (Input.text.isNotEmpty) {
        // hasilPerhitungan =
        //     int.parse(Input.text) * 2;
        switch (selectDropdown) {
          case "Kelvin":
            hasilPerhitungan = int.parse(Input.text) + 273.15;
            break;
          case "Reamur":
            hasilPerhitungan = int.parse(Input.text) * 4 / 5;
            break;
          case "Fahrenheit":
            hasilPerhitungan = (int.parse(Input.text) * 9 / 5) + 32;
            break;
          default:
        }
        // listHasil.add(hasilPerhitungan.toString());
        listHasil.add("Konversi dari " +
            Input.text +
            " Celcius ke : " +
            selectDropdown +
            " dengan Hasil adalah : " +
            hasilPerhitungan.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Konverter Suhu",
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Konverter Suhu"),
          ),
          body: Container(
            margin: EdgeInsets.all(9),
            child: Column(
              children: [
                InputSuhu(Input: Input),
                SizedBox(
                  height: 10,
                ),
                targetPerhitungan(
                    selectDropdown: selectDropdown,
                    listSatuanSuhu: listSatuanSuhu,
                    onDropdownChanged: onDropdownChange),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Hasil',
                  style: TextStyle(fontSize: 26),
                ),
                SizedBox(height: 12),
                perhitunganterakhir(hasilPerhitungan: hasilPerhitungan),
                SizedBox(
                  height: 12,
                ),
                KonversiSuhu(
                  onPressed: konversiSuhu,
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  'Riwat Konversi',
                  style: TextStyle(fontSize: 20),
                ),
                RiwayatPerhitungan(listHasil: listHasil)
              ],
            ),
          )),
    );
  }
}
