import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:apb5/helpers/addq.dart';
import 'package:apb5/helpers/helper.dart';
import 'package:apb5/data/vehicle_model.dart';
import 'package:apb5/screens/payment_completed_screen.dart';
import 'package:apb5/themes/colors/colors_manager.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart' as mlkit;


class OrderScreen extends StatefulWidget {
  final VehicleModel vehicle;
  OrderScreen({super.key, required this.vehicle});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  XFile? _image;
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedGarage;
  String? plateNumber;
  String? qrCode;
  MobileScannerController cameraController = MobileScannerController();

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
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 52.0),
                  _buildDropdown(),
                  const SizedBox(height: 20.0),
                  _buildPlateNumberField(),
                  const SizedBox(height: 20.0),
                  _buildImageUploadButton(),
                  const SizedBox(height: 20.0),
                  _buildQRScannerButton(),
                  const SizedBox(height: 20.0),
                  _buildSubmitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
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
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
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
    );
  }

  Widget _buildPlateNumberField() {
    return TextFormField(
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
    );
  }

  Widget _buildImageUploadButton() {
  return ListTile(
    leading: const Icon(Icons.image),
    title: const Text('Upload Image'),
    trailing: const Icon(CupertinoIcons.upload_circle),
    onTap: () async {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final inputImage = mlkit.InputImage.fromFilePath(image.path);
        final barcodeScanner = mlkit.BarcodeScanner();

        try {
          final List<mlkit.Barcode> barcodes = await barcodeScanner.processImage(inputImage);
          if (barcodes.isNotEmpty) {
            final String? qrCodeText = barcodes.first.rawValue;
            if (qrCodeText != null) {
              setState(() {
                qrCode = qrCodeText; 
              });
              print('QR Code Detected through image upload: $qrCode');
            } else {
              print('QR Code text is null');
            }
          } else {
            print('No QR codes detected in the image');
          }
        } catch (e) {
          print('Failed to process image for QR codes: $e');
        } finally {
          barcodeScanner.close();
        }
      }

      setState(() {
        _image = image; 
      });
    },
  );
}

  Widget _buildQRScannerButton() {
    return ListTile(
      leading: const Icon(Icons.qr_code_scanner),
      title: const Text('Scan QR Code'),
      onTap: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Scan QR Code'),
          content: SizedBox(
            width: 300,
            height: 400,
            child: MobileScanner(
              controller: cameraController,
              onDetect: (barcode, args) {
                final String? code = barcode.rawValue;
                Navigator.of(context).pop();
                if (code != null) {
                  print('QR Code Detected through camera: $code');
                  setState(() {
                    qrCode = code;
                  });
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            if (qrCode != null && selectedGarage != null && plateNumber != null) {
              addVehicle(widget.vehicle, qrCode!, selectedGarage!, plateNumber!, widget.vehicle.vehicle.toString());
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
    );
  }
}
