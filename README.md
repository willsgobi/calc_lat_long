# calc_lat_long

A package to calculate distance between two cordinate points Latitude and Longitude by Miles or Nautical Miles or Kilometers.

## Getting Started

1. Add the latest version of package to your pubspec.yaml (and run `dart pub get`);

```yaml
depencencies:
    calc_lat_lon: ^1.0.4
```

## Example

There are a number of properties that you can modify:
- Latitude1
- Longitude1
- Latitude2
- Longitude2
- Enum UnitLength.km [mi, km, nm] (miles, kilometers, nautical miles)

<hr>

```dart
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
                onChanged: (UnitLength newUnitSelected) {
                  _dropDownItemSelected(newUnitSelected);
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
                      num.parse(latitude1.text),
                      num.parse(latitude2.text),
                      num.parse(longitude1.text),
                      num.parse(longitude2.text),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
```
