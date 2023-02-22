import 'package:app_doublev/presentation/controller/register_person_controller.dart';
import 'package:app_doublev/presentation/ui/screens/register_person/summary/address_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressesInfoItems extends StatelessWidget {
  const AddressesInfoItems({super.key});

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterPersonController>(context);

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
