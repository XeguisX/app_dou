import 'package:app_doublev/presentation/ui/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  final String title;
  final String subtitle;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const CustomIcon(
                  icon: Icons.arrow_back_ios_new_outlined,
                ),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
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
          const SizedBox(height: 24),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
