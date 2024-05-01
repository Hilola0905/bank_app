
import 'package:bank_app/screens/on_boarding/pages/pages_one_screen.dart';
import 'package:bank_app/screens/on_boarding/pages/pages_three_screen.dart';
import 'package:bank_app/screens/on_boarding/pages/pages_two_screen.dart';
import 'package:flutter/material.dart';

import '../../data/local/storage_repository.dart';
import '../routes.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (index) {},
              physics: const NeverScrollableScrollPhysics(),
              children: [
                BoardingPageOne(),
                BoardingPageTwo(),
                BoardingPageThree(),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              if (activeIndex == 2) {
                StorageRepository.setBool(
                  key: "is_new_user",
                  value: true,
                ).then(
                      (value) {
                    Navigator.pushReplacementNamed(
                        context, RouteNames.authRoute);
                  },
                );
              } else {
                activeIndex += 1;
                controller.animateToPage(
                  activeIndex,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear,
                );
              }
            },
            child: Text("Next"),
          )
        ],
      ),
    );
  }
}

