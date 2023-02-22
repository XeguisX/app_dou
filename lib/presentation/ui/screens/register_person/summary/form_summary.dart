import 'package:app_doublev/presentation/controller/register_person_controller.dart';
import 'package:app_doublev/presentation/ui/screens/detail_person/person_screen.dart';
import 'package:app_doublev/presentation/ui/screens/register_person/summary/addresses_info_items.dart';
import 'package:app_doublev/presentation/ui/screens/register_person/summary/person_info_item.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_button.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormStepThree extends StatelessWidget {
  const FormStepThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterPersonController>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Información Personal',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const CustomIcon(icon: Icons.edit),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Divider(color: Colors.white60),
          const SizedBox(height: 8),
          PersonInfoItem(title: 'Nombre: ', description: registerForm.name),
          const SizedBox(height: 24),
          PersonInfoItem(
            title: 'Apellido: ',
            description: registerForm.lastName,
          ),
          const SizedBox(height: 24),
          PersonInfoItem(
            title: 'Fecha de Nacimiento: ',
            description: registerForm.birthDate,
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Direcciones',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const CustomIcon(icon: Icons.edit),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Divider(color: Colors.white60),
          const SizedBox(height: 8),
          const AddressesInfoItems(),
          const SizedBox(height: 32),
          CustomButton(
            width: double.infinity,
            label: 'Guardar',
            onPressed: () {
              registerForm.registerPerson();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PersonScreen()),
              );
            },
          )
        ],
      ),
    );
  }
}
