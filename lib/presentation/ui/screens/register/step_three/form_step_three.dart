import 'package:app_doublev/presentation/controller/register_person_provider.dart';
import 'package:app_doublev/presentation/ui/screens/register/step_three/addresses_info_items.dart';
import 'package:app_doublev/presentation/ui/screens/register/step_three/person_info_item.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormStepThree extends StatelessWidget {
  const FormStepThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterPersonProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Información Personal',
                    style: Theme.of(context).textTheme.titleLarge),
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
              title: 'Apellido: ', description: registerForm.lastName),
          const SizedBox(height: 24),
          PersonInfoItem(
            title: 'Fecha de Nacimiento: ',
            description: registerForm.birthDate,
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Direcciones',
                    style: Theme.of(context).textTheme.titleLarge),
                GestureDetector(
                  onTap: () {
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
          const AddressesInfoItems(),
        ],
      ),
    );
  }
}
