import 'package:apb5/helpers/helper.dart';
import 'package:apb5/themes/colors/colors_manager.dart';
import 'package:apb5/themes/values_manager/values_manager.dart';
import 'package:apb5/widgets/custom_button.dart';
import 'package:apb5/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: black,
              borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(ValuesManager.size28),
                      bottomRight: Radius.circular(ValuesManager.size28)),
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('${Helper.assetImagePath}mask_image.png'))),
            child: Container(
                          margin: EdgeInsets.only(top: ValuesManager.margin12),

              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: ValuesManager.margin36,
                        vertical: ValuesManager.margin36),
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          Text(
                            "Profile",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox.shrink()
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: ValuesManager.margin36,
                        right: ValuesManager.margin36,
                        bottom: ValuesManager.margin39),
                    child: Row(
                      children: [
                        Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                              image: DecorationImage(
                                  image: AssetImage(
                                      '${Helper.assetImagePath}avatar_image.png'))),
                        ),
                        const SizedBox(
                          width: 22.0,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome",
                                style:
                                    TextStyle(fontSize: 12.0, color: lightGrey),
                              ),
                              const Text(
                                "nalqzyy",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const CustomDialog();
                              },
                            );
                          },
                          child: Container(
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        '${Helper.assetImagePath}icon_sign_out.png'))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ValuesManager.padding38,
                  vertical: ValuesManager.padding40),
              decoration: const BoxDecoration(
                  color: Colors.white),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    const SettingMenuCard(
                      icon: 'ic_user.png',
                      text: 'Profile',
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    const SettingMenuCard(
                      icon: 'ic_document.png',
                      text: 'History Orders',
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    const SettingMenuCard(
                      icon: 'ic_love.png',
                      text: 'Favorite',
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    const SettingMenuCard(
                      icon: 'ic_question.png',
                      text: 'FAQ',
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    const SettingMenuCard(
                      icon: 'ic_setting.png',
                      text: 'Settings',
                    ),
                    const SizedBox(
                      height: 109.0,
                    ),
                    CustomButton(
                        text: "How can we help you?",
                        icon: Icons.headphones,
                        backgroundColor: lightGreyIconBackground,
                        textColor: Colors.white,
                        onPressed: () {}),
                    const SizedBox(
                      height: 21.0,
                    ),
                    Text(
                      "Version v.1",
                      style: TextStyle(color: black40),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SettingMenuCard extends StatelessWidget {
  final String icon;
  final String text;
  const SettingMenuCard({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 35.0,
          width: 35.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              image: DecorationImage(
                  image: AssetImage('${Helper.assetImagePath}$icon'))),
        ),
        const SizedBox(
          width: 22.0,
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 17.0, color: black),
          ),
        ),
        Container(
          height: 35.0,
          width: 35.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      '${Helper.assetImagePath}ic_arrow_right.png'))),
        ),
      ],
    );
  }
}
