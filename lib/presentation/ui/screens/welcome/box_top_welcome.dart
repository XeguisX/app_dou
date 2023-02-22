import 'package:flutter/material.dart';

class BoxTopWelcome extends StatelessWidget {
  const BoxTopWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.6,
      child: const Center(
        child: Image(
          image: AssetImage('assets/logo-app.png'),
          width: 222,
        ),
      ),
    );
  }
}
