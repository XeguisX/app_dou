import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  GlobalKey<FormState> formKeyStepOne = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyStepTwo = GlobalKey<FormState>();

  String name = '';
  String lastName = '';
  String birthDate = '';
  String place = '';
  String address = '';
}
