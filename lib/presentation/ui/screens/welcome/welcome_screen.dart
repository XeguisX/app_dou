import 'package:app_doublev/presentation/ui/screens/welcome/box_bottom_welcome.dart';
import 'package:app_doublev/presentation/ui/screens/welcome/box_top_welcome.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 13, 13, 14),
        child: Stack(
          children: [
            Column(
              children: const [
                BoxTopWelcome(),
                BoxBottomWelcome(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
