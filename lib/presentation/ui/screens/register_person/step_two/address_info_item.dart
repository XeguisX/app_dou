import 'package:app_doublev/data/address.dart';
import 'package:app_doublev/presentation/controller/register_person_controller.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_icon.dart';
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
    final registerForm = Provider.of<RegisterPersonController>(context);

    return InkWell(
      onTap: () {
        registerForm.editAddress(index);
        placeCtrl.text = address.place;
        addressCtrl.text = address.address;
      },
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lugar: " + address.place,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Dirección: " + address.address,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () => registerForm.deleteAddress(index),
            child: const CustomIcon(icon: Icons.delete),
          ),
        ],
      ),
    );
  }
}
