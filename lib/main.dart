import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(useMaterial3: true, scaffoldBackgroundColor: const Color.fromARGB(255, 141, 76, 76)),
    home: const Expenses(),
  ));
}
