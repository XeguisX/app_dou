import 'package:app_doublev/models/person.dart';
import 'package:app_doublev/providers/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_icon.dart';

class PersonsScreen extends StatelessWidget {
  const PersonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ListPersons(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListPersons extends StatelessWidget {
  const ListPersons({super.key});

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterProvider>(context);

    return ListView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: registerForm.persons.length,
      itemBuilder: (_, index) {
        return ItemPerson(person: registerForm.persons[index]);
      },
    );
  }
}

class ItemPerson extends StatelessWidget {
  const ItemPerson({super.key, required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
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
            'Usuario',
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
                      text: person.name,
                      style: textStyleContent,
                    ),
                  ],
                ),
              ),
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
                      text: person.lastName,
                      style: textStyleContent,
                    ),
                  ],
                ),
              ),
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
                      text: person.birthDate,
                      style: textStyleContent,
                    ),
                  ],
                ),
              ),
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
                      text: person.address,
                      style: textStyleContent,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
