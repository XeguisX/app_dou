import 'package:app_doublev/presentation/controller/register_person_controller.dart';
import 'package:app_doublev/presentation/ui/screens/detail_person/content/content_info_person_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DescriptionPersonProfile extends StatelessWidget {
  const DescriptionPersonProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterPersonController>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Center(
        child: Column(
          children: [
            Text(
              "${registerProvider.name} ${registerProvider.lastName}",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 42),
            const ContentInfoPerson(),
          ],
        ),
      ),
    );
  }
}
