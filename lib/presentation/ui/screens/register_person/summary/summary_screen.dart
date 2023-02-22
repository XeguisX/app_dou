import 'package:app_doublev/presentation/ui/screens/register_person/summary/form_summary.dart';
import 'package:app_doublev/presentation/ui/screens/register_person/summary/header_summary.dart';
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
            ],
          ),
        ),
      ),
    );
  }
}
