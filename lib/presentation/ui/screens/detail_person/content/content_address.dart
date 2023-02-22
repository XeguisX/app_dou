import 'package:app_doublev/presentation/controller/register_person_controller.dart';
import 'package:app_doublev/presentation/ui/screens/detail_person/content/item_info_address.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentAddress extends StatelessWidget {
  const ContentAddress({super.key});

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
            itemBuilder: (context, index) => ItemInfoAddress(
              address: registerForm.addresses[index],
            ),
          ),
        ],
      ),
    );
  }
}
