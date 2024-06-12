import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Car {
  final String vehicle;
  final String plate;
  final String garage;
  final int state;

  Car({required this.vehicle, required this.plate, required this.garage, required this.state});

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      vehicle: json['vehicle'] as String,
      plate: json['plate'] as String,
      garage: json['garage'] as String,
      state: json['state'] as int,
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<List<Car>> futureCars;

  @override
  void initState() {
    super.initState();
    futureCars = fetchCars();
  }

  Future<List<Car>> fetchCars() async {
    final response = await http.get(Uri.parse('http://192.168.18.3:3000/vehicles'));

    if (response.statusCode == 200) {
      List<dynamic> carsJson = jsonDecode(response.body);
      return carsJson.map((json) => Car.fromJson(json as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to load data from database');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),  // This is the added padding around the entire screen
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const ListTile(
                title: Text('Name'),
                subtitle: Text('Nao'),
              ),
              const ListTile(
                title: Text('Gender'),
                subtitle: Text('Female'),
              ),
              FutureBuilder<List<Car>>(
                future: futureCars,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Car car = snapshot.data![index];
                        return Card(
                          margin: const EdgeInsets.all(8.0),
                          child: ExpansionTile(
                            title: Text(car.vehicle.toUpperCase()),
                            children: [
                              ListTile(
                                title: Text('Plate'),
                                subtitle: Text(car.plate),
                              ),
                              ListTile(
                                title: Text('Garage'),
                                subtitle: Text(car.garage),
                              ),
                              ListTile(
                                title: Text('Status'),
                                subtitle: Text(car.state == 1 ? 'In Garage' : 'Outside Garage'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}
