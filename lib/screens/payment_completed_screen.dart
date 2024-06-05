import 'package:apb5/helpers/helper.dart';
import 'package:apb5/screens/home_screen.dart';
import 'package:apb5/themes/colors/colors_manager.dart';
import 'package:flutter/material.dart';

class PaymentCompletedScreen extends StatefulWidget {
  const PaymentCompletedScreen({super.key});

  @override
  State<PaymentCompletedScreen> createState() => _PaymentCompletedScreenState();
}

class _PaymentCompletedScreenState extends State<PaymentCompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 16.0
          ),
          child: Column(
            children: [
              Container(
                  height: 310.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(
                              '${Helper.assetImagePath}payment_success_image.png')))),
              const SizedBox(
                height: 60.0,
              ),
              const Text("Payment Success",style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0)),
              const SizedBox(
                height: 60.0,
              ),
              Text("Congratulations on your purchase",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0,color: black50)),
              Text("you can greet your new vehicle at your chosen garage.",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.0,color: black50)),
              const Expanded(child: SizedBox.shrink()),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ));
                            },
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 70, vertical: 21),
                                backgroundColor: lightGrey255,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0))),
                            child: const Text("Back to Home"),
                          ),
                        )
            ],
          ),
        ),
      ),
    );
  }
}
