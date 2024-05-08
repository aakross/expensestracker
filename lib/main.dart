import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColoScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 78, 17, 221));

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        //useMaterial3: true,
        colorScheme: kColoScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColoScheme.onPrimaryContainer,
          foregroundColor: kColoScheme.primaryContainer,
          centerTitle: true,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColoScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColoScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kColoScheme.onSecondaryContainer,
                  fontSize: 16),
            ),
      ),
      home: const Expenses(),
    ),
  );
}
