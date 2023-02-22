import 'package:flutter/material.dart';

class ImagePersonProfile extends StatelessWidget {
  const ImagePersonProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 54),
      child: Center(
        child: Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 0),
              ),
            ],
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: AssetImage('assets/user.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
