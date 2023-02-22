import 'package:app_doublev/presentation/controller/register_person_provider.dart';
import 'package:app_doublev/presentation/ui/screens/register/step_three/step_three_screen.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FooterStepTwo extends StatelessWidget {
  const FooterStepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterPersonProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 18),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const CustomButton(label: 'Atras'),
        ),
        CustomButton(
          label: 'Siguiente',
          onPressed: () {
            if (registerForm.address.isEmpty) {
              registerForm.formKeyStepTwo.currentState?.validate();
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const StepThreeScreen()),
            );
          },
        ),
        const SizedBox(width: 18),
      ],
    );
  }
}
