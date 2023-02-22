import 'package:app_doublev/presentation/controller/register_person_provider.dart';
import 'package:app_doublev/presentation/ui/screens/register/step_three_screen.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_button.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_icon.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      padding: const EdgeInsets.only(left: 14, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const CustomIcon(
                  icon: Icons.arrow_back_ios_new_outlined,
                ),
              ),
              const SizedBox(width: 18),
              Text(
                'Direcciones',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Paso 2 de 3',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.left,
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
    final registerForm = Provider.of<RegisterPersonProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Form(
        key: registerForm.formKeyStepTwo,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
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
    final registerForm = Provider.of<RegisterPersonProvider>(context);

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
