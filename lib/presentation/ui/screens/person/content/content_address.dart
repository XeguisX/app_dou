import 'package:app_doublev/presentation/controller/register_person_provider.dart';
import 'package:app_doublev/presentation/ui/screens/person/content/item_info_address.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentAddress extends StatelessWidget {
  const ContentAddress({super.key});

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
            itemBuilder: (context, index) => ItemInfoAddress(
              address: registerForm.addresses[index],
            ),
          ),
        ],
      ),
    );
  }
}
