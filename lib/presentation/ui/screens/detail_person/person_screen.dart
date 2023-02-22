import 'package:app_doublev/presentation/ui/screens/detail_person/body/body_person_profile.dart';
import 'package:flutter/material.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 13, 13, 14),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BodyPersonProfile(),
        ),
      ),
    );
  }
}
