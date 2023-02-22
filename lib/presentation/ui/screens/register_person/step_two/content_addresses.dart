import 'package:app_doublev/presentation/controller/register_person_controller.dart';
import 'package:app_doublev/presentation/ui/screens/register_person/step_two/address_info_item.dart';
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
    final registerForm = Provider.of<RegisterPersonController>(context);

    return registerForm.addresses.isEmpty
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                Text(
                  'Direcciones',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: registerForm.addresses.length,
                  itemBuilder: (context, index) {
                    return AddressInfoItem(
                      address: registerForm.addresses[index],
                      index: index,
                      placeCtrl: placeCtrl,
                      addressCtrl: addressCtrl,
                    );
                  },
                  separatorBuilder: (_, __) =>
                      const Divider(color: Colors.white60),
                ),
              ],
            ),
          );
  }
}
