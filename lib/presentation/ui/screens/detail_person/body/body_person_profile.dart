import 'package:app_doublev/presentation/ui/screens/detail_person/body/background_person_profile.dart';
import 'package:app_doublev/presentation/ui/screens/detail_person/body/buttons_person_profile.dart';
import 'package:app_doublev/presentation/ui/screens/detail_person/body/gradient_person_profile.dart';
import 'package:app_doublev/presentation/ui/screens/detail_person/content/content_person_profile.dart';
import 'package:flutter/material.dart';

class BodyPersonProfile extends StatelessWidget {
  const BodyPersonProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        BackgroundPersonProfile(),
        ButtonsPersonProfile(),
        GradientPersonProfile(),
        ContentPersonProfile(),
      ],
    );
  }
}
