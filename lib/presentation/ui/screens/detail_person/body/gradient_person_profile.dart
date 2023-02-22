import 'package:flutter/material.dart';

class GradientPersonProfile extends StatelessWidget {
  const GradientPersonProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 90),
      child: Container(
        width: double.infinity,
        height: 350,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 13, 13, 14).withOpacity(0),
              const Color.fromARGB(255, 13, 13, 14),
            ],
            begin: Alignment.topCenter,
            end: Alignment.center,
          ),
        ),
      ),
    );
  }
}
