import 'package:app_doublev/presentation/ui/screens/register_person/summary/summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_doublev/data/address.dart';
import 'package:app_doublev/presentation/ui/screens/register_person/step_two/content_addresses.dart';
import 'package:app_doublev/presentation/controller/register_person_controller.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_button.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_text_field.dart';

class FormStepTwo extends StatefulWidget {
  const FormStepTwo({Key? key}) : super(key: key);

  @override
  State<FormStepTwo> createState() => _FormStepTwoState();
}

class _FormStepTwoState extends State<FormStepTwo> {
  final formKeyStepTwo = GlobalKey<FormState>();
  final _textEditingControllerPlace = TextEditingController();
  final _textEditingControllerAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterPersonController>(context);

    bool isInitialValidation = true;

    String? validateTextField(String? value) {
      return value != null && value.length >= 3
          ? null
          : 'El campo debe tener más de 3 caracteres';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Form(
        key: formKeyStepTwo,
        child: Column(
          children: [
            const SizedBox(height: 24),
            CustomTextField(
              controller: _textEditingControllerPlace,
              fileType: 'Lugar',
              hintText: '  Casa o trabajo',
              autofocus: true,
              onChanged: (value) {
                if (!isInitialValidation) {
                  formKeyStepTwo.currentState?.validate();
                }
              },
              validator: validateTextField,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: _textEditingControllerAddress,
                    fileType: 'Dirección',
                    hintText: '  calle 30 #23-32',
                    autofocus: true,
                    onChanged: (value) {
                      if (!isInitialValidation) {
                        formKeyStepTwo.currentState?.validate();
                      }
                    },
                    validator: validateTextField,
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    isInitialValidation = false;
                    if (!formKeyStepTwo.currentState!.validate()) {
                      return;
                    }
                    registerForm.addAddress(
                      Address(
                        _textEditingControllerPlace.text,
                        _textEditingControllerAddress.text,
                      ),
                    );
                    _textEditingControllerPlace.text = '';
                    _textEditingControllerAddress.text = '';
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 24),
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 204, 31, 190),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ContentAddresses(
              addressCtrl: _textEditingControllerAddress,
              placeCtrl: _textEditingControllerPlace,
            ),
            const SizedBox(height: 16),
            CustomButton(
              width: double.infinity,
              label: 'Siguiente',
              onPressed: () {
                if (registerForm.addresses.isEmpty) {
                  const snackBar = SnackBar(
                    content: Text('Debe agregar al menos una dirección.'),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StepThreeScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
