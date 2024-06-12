import 'package:apb5/helpers/helper.dart';
import 'package:apb5/screens/profile_page_screen.dart';
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
          _buildHeader(),
          _buildMenuItems(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        color: black,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(ValuesManager.size28),
          bottomRight: Radius.circular(ValuesManager.size28),
        ),
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage('${Helper.assetImagePath}mask_image.png'),
        ),
      ),
      child: Column(
        children: [
          _buildTopBar(),
          _buildUserProfile(),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: ValuesManager.margin36,
          vertical: ValuesManager.margin36),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.arrow_back_ios, color: Colors.white),
          Text("Profile", style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w600)),
          SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildUserProfile() {
    return Container(
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
                    image: AssetImage('${Helper.assetImagePath}avatar_image.png'))),
          ),
          const SizedBox(width: 22.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome", style: TextStyle(fontSize: 12.0, color: lightGrey)),
                Text("Nao", style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => _showSignOutDialog(),
            child: Container(
              height: 60.0,
              width: 60.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('${Helper.assetImagePath}icon_sign_out.png'))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: ValuesManager.padding38,
            vertical: ValuesManager.padding40),
        child: ListView(
          children: [
            SettingMenuCard(
              icon: 'ic_user.png',
              text: 'Profile',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage())),
            ),
            const SizedBox(height: 32.0),
            SettingMenuCard(
              icon: 'ic_document.png',
              text: 'History Orders',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage())), // Update accordingly
            ),
            const SizedBox(height: 32.0),
            SettingMenuCard(
              icon: 'ic_love.png',
              text: 'Favorite',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage())), // Update accordingly
            ),
            const SizedBox(height: 32.0),
            SettingMenuCard(
              icon: 'ic_question.png',
              text: 'FAQ',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage())), // Update accordingly
            ),
            const SizedBox(height: 32.0),
            SettingMenuCard(
              icon: 'ic_setting.png',
              text: 'Settings',
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage())), // Update accordingly
            ),
            const SizedBox(height: 109.0),
            CustomButton(
                text: "How can we help you?",
                icon: Icons.headphones,
                backgroundColor: lightGreyIconBackground,
                textColor: Colors.white,
                onPressed: () {}),
            const SizedBox(height: 21.0),
            Text("Version v.1", style: TextStyle(color: black40)),
          ],
        ),
      ),
    );
  }

  void _showSignOutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => const CustomDialog(),
    );
  }
}

class SettingMenuCard extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onTap;

  const SettingMenuCard({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 35.0,
              width: 35.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  image: DecorationImage(
                      image: AssetImage('${Helper.assetImagePath}$icon'))),
            ),
            const SizedBox(width: 22.0),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 17.0, color: Colors.black),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
