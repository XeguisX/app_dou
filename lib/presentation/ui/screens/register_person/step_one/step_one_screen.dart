import 'package:app_doublev/presentation/ui/screens/register_person/step_one/form_step_one.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_app_bar.dart';
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
              CustomAppBar(
                title: 'Registro de usuario',
                subtitle: 'Paso 1 de 2',
                description: 'Información personal',
              ),
              SizedBox(height: 28),
              FormStepOne(),
            ],
          ),
        ),
      ),
    );
  }
}
