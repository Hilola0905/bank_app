
import 'package:bank_app/screens/profile/widget/profile_scroll_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Text("Salom"),
          Container(
            width: double.infinity,
            height: 300,
            decoration: const BoxDecoration(
              color: Colors.blue,
              // color: Colors.lightBlue,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter:
                  ColorFilter.mode(Colors.blue, BlendMode.modulate),
                  image: AssetImage("assets/images/profileTab_image.png")),
            ),
          ),
          // Text("Salom"),
          //
          profileScrollPage(context),
        ],
      ),

    );
  }
}
