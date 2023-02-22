import 'package:app_doublev/presentation/ui/screens/register/step_three/footer_step_three.dart';
import 'package:app_doublev/presentation/ui/screens/register/step_three/form_step_three.dart';
import 'package:app_doublev/presentation/ui/screens/register/step_three/header_step_three.dart';
import 'package:flutter/material.dart';

class StepThreeScreen extends StatelessWidget {
  const StepThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HeaderStepThree(),
              SizedBox(height: 28),
              FormStepThree(),
              FooterStepThree(),
            ],
          ),
        ),
      ),
    );
  }
}
