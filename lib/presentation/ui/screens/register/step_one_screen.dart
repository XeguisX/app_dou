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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _Header(),
              SizedBox(height: 28),
              _StepOneForm(),
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
                'Información Personal',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Paso 1 de 3',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}

class _StepOneForm extends StatefulWidget {
  const _StepOneForm({Key? key}) : super(key: key);

  @override
  State<_StepOneForm> createState() => _StepOneFormState();
}

class _StepOneFormState extends State<_StepOneForm> {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterPersonProvider>(context);
    bool isInitialValidation = true;
    String? errorName;
    String? errorLastName;

    String? validateTextField(String? value) {
      return value != null && value.length >= 3
          ? null
          : 'La nombre debe tener más de 3 caracteres';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Form(
        key: registerForm.formKeyStepOne,
        child: Column(
          children: [
            CustomTextField(
              fileType: 'Nombre',
              hintText: '  Abdias',
              autofocus: true,
              onChanged: (value) {
                registerForm.name = value;
                if (!isInitialValidation) {
                  registerForm.formKeyStepOne.currentState?.validate();
                }
              },
              validator: validateTextField,
            ),
            const SizedBox(height: 22),
            CustomTextField(
              fileType: 'Apellido',
              hintText: '  Eguis',
              onChanged: (value) {
                registerForm.lastName = value;

                if (!isInitialValidation) {
                  registerForm.formKeyStepOne.currentState?.validate();
                }
              },
              validator: validateTextField,
            ),
            const SizedBox(height: 22),
            CustomTextField(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  builder: (context, child) {
                    return CustomThemeDatePicker(child);
                  },
                ).then(
                  (value) {
                    if (value != null) {
                      _textEditingController.text =
                          "${value.day} - ${value.month} - ${value.year}";
                      registerForm.birthDate =
                          "${value.day} - ${value.month} - ${value.year}";
                    }
                    registerForm.formKeyStepOne.currentState?.validate();
                  },
                );
              },
              readOnly: true,
              fileType: 'Fecha de nacimiento',
              hintText: '',
              autofocus: true,
              onChanged: (value) => registerForm.birthDate = value,
              controller: _textEditingController,
              validator: (value) {
                return value != null && value.isNotEmpty
                    ? null
                    : 'Debe seleccionar la fecha de nacimiento';
              },
            ),
            const SizedBox(height: 22),
            Center(
              child: CustomButton(
                label: 'Siguiente',
                onPressed: () {
                  isInitialValidation = false;

                  if (!registerForm.formKeyStepOne.currentState!.validate()) {
                    return;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StepTwoScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Theme CustomThemeDatePicker(Widget? child) {
    return Theme(
      data: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
            onPrimary: Colors.black, // selected text color
            onSurface: Colors.white, // default text color
            primary: Color.fromARGB(255, 182, 20, 218) // circle color
            ),
        dialogBackgroundColor: Colors.black,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 204, 31, 190),
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
  }
}
