import 'package:flutter/material.dart';

//double hasil(double umur, double berat, double tinggi){
//return 66.5+13.75*berat+5.003*tinggi-6.75*umur;
//}

class Menudetail extends StatefulWidget {
  final int? umur;
  final int? berat;
  final int? tinggi;
  final double? hasil;

  const Menudetail({Key?key, this.umur, this.berat, this.tinggi, this.hasil})
  : super(key: key);

  @override
  State<Menudetail> createState() => _MenudetailState();
}

class _MenudetailState extends State<Menudetail> {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Column(
          children: [
          ],
        ),
      ),
    );
  }
}

