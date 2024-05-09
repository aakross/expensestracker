import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category {
  food,
  travel,
  leisure,
  work
} //Enum es un tipo de dato personalizado como si fuera String, int, bool, etc

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense(
      {required this.tittle,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid
            .v4(); // los : significan que es un inicializador y lo que hace es que genera un id unico dinamicamente
  final String id;
  final String tittle;
  final double amount; //Double sirve para los numeros con decimales 1.99
  final DateTime date; // DateTime nos permite guardar datos en formato de fecha
  final Category category;

  String get formattedDate {
    //Se utilizo el get
    return formatter.format(
        date); //Con la paqueteria intl se instala y se manda a llamar y se le da formato
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

//Creamos una variable final llamada expense y utilizamos "in" para decirle a Dart que queremos ir por todos los items de esa lista
//Sirve como alternativa para recorrer los elementos de una lista sin tener que usar el for normalmente
    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
