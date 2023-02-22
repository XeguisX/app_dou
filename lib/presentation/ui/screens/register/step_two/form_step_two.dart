import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_doublev/data/address.dart';
import 'package:app_doublev/presentation/ui/screens/register/step_two/content_addresses.dart';
import 'package:app_doublev/presentation/controller/register_person_provider.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_button.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_text_field.dart';

class FormStepTwo extends StatefulWidget {
  const FormStepTwo({Key? key}) : super(key: key);

  @override
  State<FormStepTwo> createState() => _FormStepTwoState();
}

class _FormStepTwoState extends State<FormStepTwo> {
  final _textEditingControllerPlace = TextEditingController();
  final _textEditingControllerAddress = TextEditingController();

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
        key: registerForm.formKeyStepTwo,
        child: Column(
          children: [
            const SizedBox(height: 22),
            CustomTextField(
              controller: _textEditingControllerPlace,
              fileType: 'Lugar',
              hintText: '  Casa o trabajo',
              autofocus: true,
              onChanged: (value) {
                registerForm.place = value;
                if (!isInitialValidation) {
                  registerForm.formKeyStepTwo.currentState?.validate();
                }
              },
              validator: validateTextField,
            ),
            const SizedBox(height: 22),
            CustomTextField(
              controller: _textEditingControllerAddress,
              fileType: 'Dirección',
              hintText: '  calle 30 #23-32',
              autofocus: true,
              onChanged: (value) {
                registerForm.address = value;
                if (!isInitialValidation) {
                  registerForm.formKeyStepTwo.currentState?.validate();
                }
              },
              validator: validateTextField,
            ),
            const SizedBox(height: 22),
            CustomButton(
              label: 'Añadir Dirección',
              width: 154,
              height: 48,
              onPressed: () {
                isInitialValidation = false;

                if (!registerForm.formKeyStepTwo.currentState!.validate()) {
                  return;
                }
                registerForm.addAddress(
                  Address(registerForm.place, registerForm.address),
                  _textEditingControllerPlace,
                  _textEditingControllerAddress,
                );
              },
            ),
            const SizedBox(height: 16),
            Text(
              'Direcciones',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ContentAddresses(
              addressCtrl: _textEditingControllerAddress,
              placeCtrl: _textEditingControllerPlace,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
