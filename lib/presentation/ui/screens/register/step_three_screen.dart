import 'package:app_doublev/data/person.dart';
import 'package:app_doublev/presentation/controller/register_person_provider.dart';
import 'package:app_doublev/presentation/ui/screens/persons_screen.dart';
import 'package:app_doublev/presentation/ui/screens/register/step_two_screen.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_button.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_icon.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StepThreeScreen extends StatelessWidget {
  const StepThreeScreen({super.key});

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
            'Paso 3 de 3',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
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

    const TextStyle textStyleTitle = TextStyle(
        color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 16);
    const TextStyle textStyleContent =
        TextStyle(color: Colors.white70, fontSize: 16);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Revisa y confirma',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Nombre: ',
                      style: textStyleTitle,
                    ),
                    TextSpan(
                      text: registerForm.name,
                      style: textStyleContent,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const CustomIcon(icon: Icons.edit),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Apellido: ',
                      style: textStyleTitle,
                    ),
                    TextSpan(
                      text: registerForm.lastName,
                      style: textStyleContent,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const CustomIcon(icon: Icons.edit),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Fecha de nacimiento: ',
                      style: textStyleTitle,
                    ),
                    TextSpan(
                      text: registerForm.birthDate,
                      style: textStyleContent,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const CustomIcon(icon: Icons.edit),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Dirección: ',
                      style: textStyleTitle,
                    ),
                    TextSpan(
                      text: registerForm.address,
                      style: textStyleContent,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const CustomIcon(icon: Icons.edit),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterPersonProvider>(context);

    return Center(
      child: CustomButton(
        label: 'Guardar',
        onPressed: () async {
          await registerForm.storePerson(
            Person(
              registerForm.name,
              registerForm.lastName,
              registerForm.birthDate,
              registerForm.address,
            ),
          );

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PersonsScreen()),
          );
        },
      ),
    );
  }
}
