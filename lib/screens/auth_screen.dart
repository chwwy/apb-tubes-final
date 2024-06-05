import 'package:apb5/helpers/helper.dart';
import 'package:apb5/screens/home_screen.dart';
import 'package:apb5/themes/colors/colors_manager.dart';
import 'package:apb5/themes/values_manager/strings.dart';
import 'package:apb5/themes/values_manager/values_manager.dart';
import 'package:apb5/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ValuesManager.padding36),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('${Helper.assetImagePath}login_image.png'))),
          ),
          const SizedBox(
            height: 80.0,
          ),
          const Text(
            "Welcome",
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          const SizedBox(
            height: 7.0,
          ),
          const Text("Find the best vehicle for you"),
          const SizedBox(
            height: 65.0,
          ),
          Text(
            "Authentication",
            style: TextStyle(color: red, fontSize: 18),
          ),
          const SizedBox(
            height: 30.0,
          ),
          CustomButton(
              text: Strings.loginButtonText,
              icon: Icons.star,
              backgroundColor: black,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
              }),
          const SizedBox(
            height: 27.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Strings.registerButtonText,
              ),
              Text(
                Strings.signUp,
                style: TextStyle(color: red),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
