import 'package:flutter/material.dart';

class BackgroundPersonProfile extends StatelessWidget {
  const BackgroundPersonProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        child: SizedBox(
          width: double.infinity,
          height: 274,
          child: Image(
            image: AssetImage('assets/image_1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
