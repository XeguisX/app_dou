import 'dart:async';
import 'package:app_doublev/double_v_app.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(() {
    runApp(const DoubleVApp());
  }, (error, stack) {
    debugPrint(stack.toString());
  });
}
