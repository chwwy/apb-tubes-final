import 'package:apb5/data/vehicle_model.dart';
import 'package:flutter/material.dart';
import 'package:apb5/helpers/addq.dart';  // Ensure this contains the addVehicle method
import 'package:apb5/helpers/helper.dart'; // Ensure paths are correctly defined here
import 'package:apb5/screens/payment_completed_screen.dart';
import 'package:apb5/themes/colors/colors_manager.dart'; // Ensure colors are correctly defined here

class OrderScreen extends StatefulWidget {
   OrderScreen({super.key, required this.vehicle});

   final VehicleModel vehicle;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedGarage;
  String? plateNumber;
  List<String> garages = [
    'Motel Garage',
    'littleseoul',
    'pillboxgarage',
    'Lost MC'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(  // Use SingleChildScrollView to prevent overflow when keyboard appears
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 24.0,
                          width: 24.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('${Helper.assetImagePath}ic_arrow_left.png'),
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "Payment Details",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
                      ),
                      const SizedBox(width: 24.0, height: 24.0),
                    ],
                  ),
                  const SizedBox(height: 52.0),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: "Select Garage",
                      border: OutlineInputBorder(),
                    ),
                    value: selectedGarage,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedGarage = newValue;
                      });
                    },
                    items: garages.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Plate Number',
                      hintText: 'Enter your vehicle plate number',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a plate number';
                      }
                      return null;
                    },
                    onSaved: (value) => plateNumber = value,
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          if (selectedGarage != null && plateNumber != null) {
                            addVehicle(selectedGarage!, plateNumber!, widget.vehicle.vehicle.toString());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PaymentCompletedScreen(),
                              ),
                            );
                          } else {
                            print('Please select a garage and enter a plate number.');
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 21),
                        backgroundColor: lightGrey255,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      child: const Text("Pay Now"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
