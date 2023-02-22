import 'package:app_doublev/data/person.dart';
import 'package:app_doublev/presentation/ui/screens/detail_person/content/item_person.dart';
import 'package:flutter/material.dart';

class ItemInfoPerson extends StatelessWidget {
  const ItemInfoPerson({super.key, required this.person});

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
            title: 'Fecha de Nacimiento',
            description: person.birthDate,
          ),
        ],
      ),
    );
  }
}
