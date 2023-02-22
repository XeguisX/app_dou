import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_doublev/presentation/controller/register_person_provider.dart';
import 'package:app_doublev/presentation/ui/screens/register/step_two/step_two_screen.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_button.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_text_field.dart';

class FormStepOne extends StatefulWidget {
  const FormStepOne({Key? key}) : super(key: key);

  @override
  State<FormStepOne> createState() => _FormStepOneState();
}

class _FormStepOneState extends State<FormStepOne> {
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterPersonProvider>(context);
    bool isInitialValidation = true;

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
                    if (!isInitialValidation) {
                      registerForm.formKeyStepOne.currentState?.validate();
                    }
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
