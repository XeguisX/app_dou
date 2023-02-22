import 'package:app_doublev/presentation/ui/screens/home/person_screen.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class FooterStepThree extends StatelessWidget {
  const FooterStepThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButton(
        label: 'Guardar',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PersonScreen()),
          );
        },
      ),
    );
  }
}
