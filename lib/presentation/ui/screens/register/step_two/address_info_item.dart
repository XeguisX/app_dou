import 'package:app_doublev/data/address.dart';
import 'package:app_doublev/presentation/controller/register_person_provider.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_icon.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressInfoItem extends StatelessWidget {
  const AddressInfoItem({
    super.key,
    required this.address,
    required this.index,
    required this.placeCtrl,
    required this.addressCtrl,
  });

  final Address address;
  final int index;

  final TextEditingController placeCtrl;
  final TextEditingController addressCtrl;

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
          GestureDetector(
            onTap: () {
              registerForm.editAddress(index, placeCtrl, addressCtrl);
            },
            child: const CustomIcon(icon: Icons.edit),
          ),
          GestureDetector(
            onTap: () {
              registerForm.deleteAddress(index);
            },
            child: const CustomIcon(icon: Icons.delete),
          ),
        ],
      ),
    );
  }
}
