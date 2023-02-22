import 'package:app_doublev/data/address.dart';
import 'package:app_doublev/data/person.dart';
import 'package:app_doublev/presentation/controller/register_person_provider.dart';
import 'package:app_doublev/presentation/ui/screens/welcome/welcome_screen.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_icon.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonsScreen extends StatelessWidget {
  const PersonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registerPersonProvider = Provider.of<RegisterPersonProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black38,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Información Personal',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(width: 2),
                    GestureDetector(
                      onTap: () {
                        registerPersonProvider.resetForms();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WelcomeScreen()),
                        );
                      },
                      child: const CustomIcon(icon: Icons.logout),
                    ),
                  ],
                ),
              ),
              InfoPerson(
                person: Person(
                  registerPersonProvider.name,
                  registerPersonProvider.lastName,
                  registerPersonProvider.birthDate,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                child: Text(
                  'Direcciones',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const ContentAddresses(),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoPerson extends StatelessWidget {
  const InfoPerson({super.key, required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemPerson(title: 'Nombre', description: person.name),
          const SizedBox(height: 24),
          ItemPerson(title: 'Apellido', description: person.lastName),
          const SizedBox(height: 24),
          ItemPerson(
              title: 'Fecha de Nacimiento', description: person.birthDate),
        ],
      ),
    );
  }
}

class ItemPerson extends StatelessWidget {
  const ItemPerson({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            children: [
              TextSpan(
                text: "$title: ",
                style: const TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: description,
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ContentAddresses extends StatelessWidget {
  const ContentAddresses({super.key});

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
            itemBuilder: (context, index) => AddressInfoItem(
              address: registerForm.addresses[index],
            ),
          ),
        ],
      ),
    );
  }
}

class AddressInfoItem extends StatelessWidget {
  const AddressInfoItem({super.key, required this.address});

  final Address address;

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterPersonProvider>(context);

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
        ],
      ),
    );
  }
}
