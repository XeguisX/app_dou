import 'package:app_doublev/data/person.dart';
import 'package:app_doublev/presentation/controller/register_person_controller.dart';
import 'package:app_doublev/presentation/ui/screens/detail_person/content/content_address.dart';
import 'package:app_doublev/presentation/ui/screens/detail_person/content/item_info_person.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentInfoPerson extends StatelessWidget {
  const ContentInfoPerson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterPersonController>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Información Personal',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(width: 2),
            ],
          ),
        ),
        ItemInfoPerson(
          person: Person(
            registerProvider.name,
            registerProvider.lastName,
            registerProvider.birthDate,
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
        const ContentAddress(),
      ],
    );
  }
}
