import 'package:app_doublev/presentation/controller/register_person_provider.dart';
import 'package:app_doublev/presentation/ui/screens/register/step_two_screen.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_button.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_icon.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StepOneScreen extends StatelessWidget {
  const StepOneScreen({super.key});

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
            'Paso 1 de 3',
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
              MaterialPageRoute(builder: (context) => const StepTwoScreen()),
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
    final registerForm = Provider.of<RegisterPersonProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 38),
      child: Form(
        key: registerForm.formKeyStepOne,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            CustomTextField(
              fileType: 'Nombre',
              hintText: '  Abdias',
              autofocus: true,
              onChanged: (value) => registerForm.name = value,
              validator: (value) {
                return value != null && value.length >= 4
                    ? null
                    : 'La nombre debe tener más de 4 caracteres';
              },
            ),
            const SizedBox(height: 22),
            CustomTextField(
              fileType: 'Apellido',
              hintText: '  Eguis',
              onChanged: (value) => registerForm.lastName = value,
              validator: (value) {
                return value != null && value.length >= 4
                    ? null
                    : 'La nombre debe tener más de 4 caracteres';
              },
            ),
            const SizedBox(height: 22),
            CustomTextField(
              onTap: () => showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now(),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData.dark().copyWith(
                      colorScheme: const ColorScheme.dark(
                          onPrimary: Colors.black, // selected text color
                          onSurface: Colors.white, // default text color
                          primary:
                              Color.fromARGB(255, 182, 20, 218) // circle color
                          ),
                      dialogBackgroundColor: Colors.black,
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 204, 31, 190),
                          textStyle: const TextStyle(
                            color: Color.fromARGB(255, 204, 31, 190),
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            fontFamily: 'Quicksand',
                          ), // color of button's letters
                          backgroundColor: Colors.black, // Background color
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
              ),
              fileType: 'Fecha de nacimiento',
              hintText: '',
              autofocus: true,
              onChanged: (value) => registerForm.birthDate = value,
            ),
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

    return Center(
      child: CustomButton(
        label: 'Siguiente',
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StepTwoScreen()),
        ),
      ),
    );
  }
}