import 'package:app_doublev/presentation/controller/register_person_controller.dart';
import 'package:app_doublev/presentation/ui/screens/welcome/welcome_screen.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonsPersonProfile extends StatelessWidget {
  const ButtonsPersonProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterPersonController>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox.shrink(),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  registerProvider.resetPerson();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ),
                  );
                },
                child: const CustomIcon(icon: Icons.logout),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
