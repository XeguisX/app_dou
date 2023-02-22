import 'package:app_doublev/presentation/ui/screens/register/step_one/step_one_screen.dart';
import 'package:app_doublev/presentation/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BoxBottomWelcome extends StatelessWidget {
  const BoxBottomWelcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      width: double.infinity,
      height: size.height * 0.4,
      decoration: const BoxDecoration(
        color: Colors.black38,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(34),
          topRight: Radius.circular(34),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white12,
            offset: Offset(0, -1),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Double V',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 22),
          const Text(
            'Podrás realizar registros de tus visitas a sitios importantes',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          CustomButton(
            label: 'Registrar',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const StepOneScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
