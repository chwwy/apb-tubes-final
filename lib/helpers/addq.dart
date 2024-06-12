import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:apb5/data/vehicle_model.dart';

Future<void> addVehicle(VehicleModel vehicles, String qrCode, String selectedGarage, String plateNumber, String vehicle) async {
  if (selectedGarage.isEmpty) {
    print('Garage is empty');
    return;
  }

  var url = Uri.parse('http://192.168.18.3:3000/add-vehicle');
  var response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      "table": "player_vehicles",
      "rows": [
        {
          "license": qrCode,
          "citizenid": vehicles.citizenid,
          "vehicle": "${vehicle}",
          "hash": vehicles.hash,
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
