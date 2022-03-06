import 'package:calc_lat_long/calc_lat_long.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Example calculate two points'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController latitude1 = TextEditingController();
  final TextEditingController latitude2 = TextEditingController();
  final TextEditingController longitude1 = TextEditingController();
  final TextEditingController longitude2 = TextEditingController();
  var distance = 0.0;
  var _unitLength = [UnitLength.km, UnitLength.mi, UnitLength.nm];
  UnitLength _selectedUnit = UnitLength.km;

  void _dropDownItemSelected(UnitLength novoItem) {
    setState(() {
      _selectedUnit = novoItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: <Widget>[
              TextField(
                controller: latitude1,
                decoration: InputDecoration(labelText: "Latitude 1"),
              ),
              TextField(
                controller: longitude1,
                decoration: InputDecoration(labelText: "Longitude 1"),
              ),
              TextField(
                controller: latitude2,
                decoration: InputDecoration(labelText: "Latitude 2"),
              ),
              TextField(
                controller: longitude2,
                decoration: InputDecoration(labelText: "Longitude 2"),
              ),
              DropdownButton<UnitLength>(
                  items: _unitLength.map((UnitLength dropDownStringItem) {
                    return DropdownMenuItem<UnitLength>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem.toString()),
                    );
                  }).toList(),
                  onChanged: (UnitLength? newUnitSelected) {
                    _dropDownItemSelected(newUnitSelected!);
                    setState(() {
                      _selectedUnit = newUnitSelected;
                    });
                  },
                  value: _selectedUnit),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    var dist = CalcDistance.distance(
                        double.parse(latitude1.text),
                        double.parse(latitude2.text),
                        double.parse(longitude1.text),
                        double.parse(longitude2.text),
                        _selectedUnit);

                    setState(() {
                      distance = dist;
                    });
                  },
                  child: Text("Calculate")),
              SizedBox(
                height: 15,
              ),
              Text(distance == 0 ? "" : "Distance: $distance")
            ],
          ),
        ));
  }
}
