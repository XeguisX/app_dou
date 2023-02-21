import 'package:app_doublev/providers/register_provider.dart';
import 'package:app_doublev/screens/register/step_three_screen.dart';
import 'package:app_doublev/widgets/custom_button.dart';
import 'package:app_doublev/widgets/custom_icon.dart';
import 'package:app_doublev/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StepTwoScreen extends StatelessWidget {
  const StepTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _Header(),
              SizedBox(height: 28),
              _StepOneForm(),
              _Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 22, left: 24),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const CustomIcon(
              icon: Icons.arrow_back_ios_new_outlined,
            ),
          ),
          const SizedBox(width: 18),
          const Text(
            'Paso 2 de 3',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(width: 160),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const StepThreeScreen()),
            ),
            child: const CustomIcon(
              icon: Icons.arrow_forward_ios_outlined,
            ),
          ),
        ],
      ),
    );
  }
}

class _StepOneForm extends StatelessWidget {
  const _StepOneForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 22),
      child: Form(
        key: registerForm.formKeyStepTwo,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            CustomTextField(
              fileType: 'Fecha de nacimiento',
              hintText: '',
              autofocus: true,
              onChanged: (value) => registerForm.birthDate = value,
            ),
            const SizedBox(height: 22),
            CustomTextField(
              fileType: 'Lugar',
              hintText: '  Casa o trabajo',
              autofocus: true,
              onChanged: (value) => registerForm.place = value,
              validator: (value) {
                return value != null && value.length >= 4
                    ? null
                    : 'La nombre debe tener más de 4 caracteres';
              },
            ),
            const SizedBox(height: 22),
            CustomTextField(
              fileType: 'Dirección',
              hintText: '  calle 30 #23-32',
              autofocus: true,
              onChanged: (value) => registerForm.address = value,
              validator: (value) {
                return value != null && value.length >= 4
                    ? null
                    : 'La nombre debe tener más de 4 caracteres';
              },
            ),
            const SizedBox(height: 22),
            CustomButton(label: 'Añadir Dirección', width: 154, height: 48),
            const SizedBox(height: 22),
          ],
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 18),
        const CustomButton(label: 'Atras'),
        CustomButton(
          label: 'Siguiente',
          onPressed: () {
            print(registerForm.name);
            print(registerForm.lastName);
            print(registerForm.birthDate);
            print(registerForm.place);
            print(registerForm.address);
          },
        ),
        const SizedBox(width: 18),
      ],
    );
  }
}
