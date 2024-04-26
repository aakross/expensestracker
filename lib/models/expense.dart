import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, travel, leisure, work }//Enum es un tipo de dato personalizado como si fuera String, int, bool, etc

class Expense {
  Expense({
    required this.tittle,
    required this.amount,
    required this.date,
    required this.category
  }) : id = uuid.v4(); // los : significan que es un inicializador y lo que hace es que genera un id unico dinamicamente
  final String id;
  final String tittle;
  final double amount; //Double sirve para los numeros con decimales 1.99
  final DateTime date; // DateTime nos permite guardar datos en formato de fecha
  final Category category;
}
