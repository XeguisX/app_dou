import 'package:app_doublev/presentation/ui/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class HeaderStepOne extends StatelessWidget {
  const HeaderStepOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const CustomIcon(
                  icon: Icons.arrow_back_ios_new_outlined,
                ),
              ),
              const SizedBox(width: 18),
              Text(
                'Información Personal',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            'Paso 1 de 3',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
