import 'package:app_doublev/presentation/ui/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class HeaderStepThree extends StatelessWidget {
  const HeaderStepThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const CustomIcon(
              icon: Icons.arrow_back_ios_new_outlined,
            ),
          ),
          Text(
            'Revisar y confirmar',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.left,
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const CustomIcon(
              icon: Icons.close,
            ),
          ),
        ],
      ),
    );
  }
}
