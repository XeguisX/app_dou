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

  List<Person> persons = [];

  storePerson(Person person) {
    persons = [...persons, person];

    name = '';
    lastName = '';
    birthDate = '';
    place = '';
    address = '';

    formKeyStepOne.currentState?.reset();
    formKeyStepTwo.currentState?.reset();

    print(persons);

    notifyListeners();
  }
}
