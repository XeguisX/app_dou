import 'package:app_doublev/presentation/ui/screens/register/step_two/footer_step_two.dart';
import 'package:app_doublev/presentation/ui/screens/register/step_two/form_step_two.dart';
import 'package:app_doublev/presentation/ui/screens/register/step_two/header_step_two.dart';
import 'package:flutter/material.dart';

class StepTwoScreen extends StatelessWidget {
  const StepTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HeaderStepTwo(),
              SizedBox(height: 28),
              FormStepTwo(),
              FooterStepTwo(),
            ],
          ),
        ),
      ),
    );
  }
}
