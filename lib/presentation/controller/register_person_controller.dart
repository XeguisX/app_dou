import 'package:app_doublev/data/address.dart';
import 'package:app_doublev/data/person.dart';
import 'package:app_doublev/data/person_local_data_source.dart';
import 'package:flutter/material.dart';

class RegisterPersonController extends ChangeNotifier {
  String name = '';
  String lastName = '';
  String birthDate = '';

  List<Address> addresses = [];

  registerPerson() {
    PersonLocalDataSource().register(Person(name, lastName, birthDate));
  }

  addAddress(Address address) {
    addresses = [...addresses, address];
    notifyListeners();
  }

  deleteAddress(int index) {
    addresses.removeAt(index);
    notifyListeners();
  }

  editAddress(int index) {
    addresses.removeAt(index);
    notifyListeners();
  }

  resetPerson() {
    name = '';
    lastName = '';
    birthDate = '';
    addresses = [];
    notifyListeners();
  }
}
