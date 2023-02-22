import 'package:app_doublev/data/address.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({
    super.key,
    required this.address,
    required this.index,
  });

  final Address address;
  final int index;

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
