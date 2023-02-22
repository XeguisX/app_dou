import 'package:app_doublev/presentation/ui/screens/register_person/step_two/form_step_two.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_app_bar.dart';
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
              CustomAppBar(
                title: 'Registro de usuario',
                subtitle: 'Paso 2 de 2',
                description: 'Direcciones recurrentes',
              ),
              SizedBox(height: 28),
              FormStepTwo(),
            ],
          ),
        ),
      ),
    );
  }
}
