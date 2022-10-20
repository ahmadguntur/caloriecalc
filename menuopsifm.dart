import 'package:caloriecalculator/constants.dart';
import 'package:caloriecalculator/screens/home/components/calorieicon_icons.dart';
import 'package:caloriecalculator/screens/home/components/menudetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Menuopsifm extends StatefulWidget {
  const Menuopsifm({super.key});

  @override
  State<Menuopsifm> createState() => _MenuopsifmState();
}

class _MenuopsifmState extends State<Menuopsifm> {

  _MenuopsifmState(){
    _selectedActivity = _activityList[0];
  }

  final _umurController = TextEditingController();
  final _beratController = TextEditingController();
  final _tinggiController = TextEditingController();
  final _activityList = ["High Mobility", "Average Mobilty","Low Mobility"];
  String? _selectedActivity = " ";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Please Fill Form Below"),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        color: kBackgroundColor,
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            _imagecenter(),
            _textboxumur(),
            _textboxberat(),
            _textboxtinggi(),
            _dropdownactivity(),
            _buttonConfirm()
          ],
        ),
      ),
    );
  }

  _imagecenter(){
    return Container(
      child: Center(
        child: Column(
          children: [
            Image.asset("assets/images/healthy400.png",
            height: 300,
            )
          ],
        ),
      ) ,
    );
  }

  _textboxumur(){
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: TextField(
        decoration: const InputDecoration(
          labelText: "Age",
          prefixIcon: Icon(Calorieicon.age),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'questgrande',
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),
        controller: _umurController,
      ),
    );
  }

  _textboxberat(){
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: TextField(
        decoration: const InputDecoration(
          prefixIcon: Icon(Calorieicon.weight),
          labelText: "Weight",
          border: OutlineInputBorder(
             borderRadius: BorderRadius.all(Radius.circular(10))
          )
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'questgrande',
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),
        controller: _beratController,
      ),
    );
  }

  _textboxtinggi(){
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: TextField(
        decoration: const InputDecoration(
          prefixIcon: Icon(Calorieicon.height),
          labelText: "Height",
          border: OutlineInputBorder(
             borderRadius: BorderRadius.all(Radius.circular(10))
          )
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'questgrande',
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),
        controller: _tinggiController,
      ),
    );
  }

  _dropdownactivity(){
   return Container(
    padding: const EdgeInsets.only(top: 15),
     child: DropdownButtonFormField(
      value: _selectedActivity,
      items: _activityList.map(
        (e) => DropdownMenuItem(child: Text(e),value: e,) 
      ).toList(),
      onChanged: (val){
        setState(() {
          _selectedActivity = val as String;
        });
      },
      icon:  const Icon(
        Icons.arrow_drop_down_circle,
        color: kPrimaryColor,
      ),
      decoration: InputDecoration(
        labelText: "Activity",
        border: OutlineInputBorder(
           borderRadius: BorderRadius.all(Radius.circular(10))
        )
      ),
      style: TextStyle(
          color: Colors.black,
          fontFamily: 'questgrande',
          fontSize: 18
      ),
      ),
   );
  }

  _buttonConfirm(){
    return Container(
      padding: const EdgeInsets.only(top: 25),
      child: SizedBox(
        width: 100,
        height: 50,
        child: TextButton(
          child: Text('Confirm',
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'questgrande',
              fontWeight: FontWeight.bold
            ),          
          ),
          style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: kPrimaryColor,
                  onSurface: Colors.grey,
                ),
          onPressed: (){
            int umur = int.parse(_umurController.text);
            int berat = int.parse(_beratController.text);
            int tinggi = int.parse(_tinggiController.text);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Menudetail(
                  umur: umur,
                  berat: berat,
                  tinggi: tinggi,
              )),
           );
          }      
        ),
      ),
    );
  }
}

