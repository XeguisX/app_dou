import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.fileType,
    this.isPassword = false,
    this.isEmail = false,
    this.autofocus = false,
    this.validator,
    this.onChanged,
    this.enabled = true,
    this.initialValue = '',
    this.onTap,
  });

  final String? initialValue;
  final String fileType;
  final String hintText;
  final bool? autofocus;
  final bool? enabled;
  final bool? isPassword;
  final bool? isEmail;
  final Function()? onTap;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 8),
            child: Text(
              fileType,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white54,
              ),
            ),
          ),
          TextFormField(
            onTap: onTap,
            initialValue: initialValue!,
            enabled: enabled!,
            autofocus: autofocus!,
            keyboardType:
                isEmail! ? TextInputType.emailAddress : TextInputType.text,
            obscureText: isPassword!,
            style: const TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: const Color.fromARGB(15, 255, 255, 255),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.white10,
                ),
                borderRadius: BorderRadius.circular(18.0),
              ),
              focusedBorder: GradientOutlineInputBorder(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 182, 20, 218),
                    Color.fromARGB(255, 204, 31, 190),
                  ],
                ),
                width: 2,
                borderRadius: BorderRadius.circular(18.0),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.white30),
              errorStyle:
                  const TextStyle(color: Color.fromARGB(255, 204, 31, 190)),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: Color.fromARGB(255, 204, 31, 190),
                ),
                borderRadius: BorderRadius.circular(18.0),
              ),
              focusedErrorBorder: GradientOutlineInputBorder(
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 182, 20, 218),
                    Color.fromARGB(255, 204, 31, 190),
                  ],
                ),
                width: 2,
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            onChanged: onChanged,
            validator: validator,
          ),
        ],
      ),
    );
  }
}
