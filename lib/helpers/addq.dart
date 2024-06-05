import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> addVehicle(String selectedGarage, String plateNumber, String vehicle) async {
  if (selectedGarage.isEmpty) {
    print('Garage is empty');
    return;
  }

  var url = Uri.parse('http://localhost:3000/add-vehicle');
  var response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      "table": "player_vehicles",
      "rows": [
        {
          "license": "license2:bac98ea18022df59b9674fe667eadfef0390c660",
          "citizenid": "H6VJPNF3",
          "vehicle": "${vehicle}",
          "hash": "-295689028",
          "mods": '{"plate":"$plateNumber"}',
          "plate": plateNumber,
          "fakeplate": null,
          "garage": selectedGarage,
          "fuel": 100,
          "engine": 1000,
          "body": 1000,
          "state": 1,
          "depotprice": 0,
          "drivingdistance": null,
          "status": null,
          "glovebox": null,
          "trunk": null
        }
      ]
    }),
  );

  if (response.statusCode == 200) {
    print('Vehicle added successfully');
  } else {
    print('Failed to add vehicle: ${response.body}');
  }
}
