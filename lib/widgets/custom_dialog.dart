import 'package:apb5/screens/auth_screen.dart';
import 'package:apb5/themes/colors/colors_manager.dart';
import 'package:apb5/themes/values_manager/values_manager.dart';
import 'package:apb5/widgets/custom_chip_button.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Are you sure you want to',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20.0),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'quit',
                style: TextStyle(fontSize: 20.0, color: red),
              ),
              const Text(
                '?',
                style: TextStyle(fontSize: 20.0),
              ),
            ]),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              CustomChipButton(
                  text: "Yes",
                  textColor: Colors.white,
                  backgroundColor: red,
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AuthScreen(),));
                  }),
                  SizedBox(width: ValuesManager.margin4,),
              CustomChipButton(
                  text: "No",
                  textColor: black,
                  backgroundColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ]),
          ],
        ),
      ),
    );
  }
}
