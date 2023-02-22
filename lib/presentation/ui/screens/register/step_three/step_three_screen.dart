import 'package:app_doublev/data/address.dart';
import 'package:app_doublev/data/person.dart';
import 'package:app_doublev/presentation/controller/register_person_provider.dart';
import 'package:app_doublev/presentation/ui/screens/persons_screen.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_button.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_icon.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StepThreeScreen extends StatelessWidget {
  const StepThreeScreen({super.key});

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
                'Revisar y confirmar',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Paso 3 de 3',
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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PersonInfoItem(title: 'Nombre: ', description: registerForm.name),
          const SizedBox(height: 24),
          PersonInfoItem(
              title: 'Apellido: ', description: registerForm.lastName),
          const SizedBox(height: 24),
          PersonInfoItem(
              title: 'Fecha de Nacimiento: ',
              description: registerForm.birthDate),
          const SizedBox(height: 24),
          Text('Direcciones', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          const AddressesInfoItems(),
        ],
      ),
    );
  }
}

class PersonInfoItem extends StatelessWidget {
  const PersonInfoItem({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            children: [
              TextSpan(
                text: title,
                style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              TextSpan(
                text: description,
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        const CustomIcon(icon: Icons.edit),
      ],
    );
  }
}

class AddressesInfoItems extends StatelessWidget {
  const AddressesInfoItems({super.key});

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterPersonProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: registerForm.addresses.length,
            itemBuilder: (context, index) => AddressItem(
              address: registerForm.addresses[index],
              index: index,
            ),
          ),
        ],
      ),
    );
  }
}

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    required this.address,
    required this.index,
  });

  final Address address;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(address.place,
              style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
          AutoSizeText(address.address,
              maxLines: 1,
              style: const TextStyle(color: Colors.white70, fontSize: 16)),
          const SizedBox(width: 2),
          GestureDetector(
            onTap: () {
              // registerForm.editAddress(index, placeCtrl, addressCtrl);
            },
            child: const CustomIcon(icon: Icons.edit),
          ),
          GestureDetector(
            onTap: () {
              // registerForm.deleteAddress(index);
            },
            child: const CustomIcon(icon: Icons.delete),
          ),
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PersonsScreen()),
          );
        },
      ),
    );
  }
}
