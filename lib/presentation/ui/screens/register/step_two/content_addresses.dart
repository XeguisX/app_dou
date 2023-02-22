import 'package:app_doublev/presentation/controller/register_person_provider.dart';
import 'package:app_doublev/presentation/ui/screens/register/step_two/address_info_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContentAddresses extends StatelessWidget {
  const ContentAddresses({
    super.key,
    required this.placeCtrl,
    required this.addressCtrl,
  });

  final TextEditingController placeCtrl;
  final TextEditingController addressCtrl;

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
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    AddressInfoItem(
                      address: registerForm.addresses[index],
                      index: index,
                      placeCtrl: placeCtrl,
                      addressCtrl: addressCtrl,
                    ),
                    const Divider(color: Colors.white60),
                  ],
                );
              }),
        ],
      ),
    );
  }
}
