import 'package:app_doublev/data/address.dart';
import 'package:app_doublev/data/person.dart';
import 'package:flutter/material.dart';

class RegisterPersonProvider extends ChangeNotifier {
  GlobalKey<FormState> formKeyStepOne = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyStepTwo = GlobalKey<FormState>();

  String name = '';
  String lastName = '';
  String birthDate = '';
  String place = '';
  String address = '';

  List<Address> addresses = [];

  addAddress(Address address, TextEditingController placeCtrl,
      TextEditingController addressCtrl) {
    addresses = [...addresses, address];
    placeCtrl.text = '';
    addressCtrl.text = '';
    notifyListeners();
  }

  deleteAddress(int index) {
    addresses.removeAt(index);
    place = '';
    address = '';
    notifyListeners();
  }

  editAddress(int index, TextEditingController placeCtrl,
      TextEditingController addressCtrl) {
    placeCtrl.text = addresses[index].place;
    addressCtrl.text = addresses[index].address;

    addresses.removeAt(index);

    notifyListeners();
  }

  resetForms() {
    name = '';
    lastName = '';
    birthDate = '';
    place = '';
    address = '';
    addresses = [];

    formKeyStepOne.currentState!.reset();
    formKeyStepTwo.currentState!.reset();

    notifyListeners();
  }
}
