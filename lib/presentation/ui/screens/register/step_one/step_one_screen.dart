import 'package:app_doublev/presentation/ui/screens/register/step_one/form_step_one.dart';
import 'package:app_doublev/presentation/ui/screens/register/step_one/header_step_one.dart';
import 'package:flutter/material.dart';

class StepOneScreen extends StatelessWidget {
  const StepOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HeaderStepOne(),
              SizedBox(height: 28),
              FormStepOne(),
            ],
          ),
        ),
      ),
    );
  }
}
