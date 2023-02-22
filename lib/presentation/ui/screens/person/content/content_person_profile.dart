import 'package:app_doublev/presentation/ui/screens/person/content/descrition_person_profile.dart';
import 'package:app_doublev/presentation/ui/screens/person/content/image_person_profile.dart';
import 'package:flutter/material.dart';

class ContentPersonProfile extends StatelessWidget {
  const ContentPersonProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ImagePersonProfile(),
        DescriptionPersonProfile(),
      ],
    );
  }
}
