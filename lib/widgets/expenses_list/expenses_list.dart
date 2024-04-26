import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    //ListView se utiliza en lugar de Column cuando no sabes la longitud de esta en este caso es dinamico o se podria usar para una base de datos
    //builder lo que hace es que solo construye los elementos de la lista cuando se necesitan y esto ayuda al rendimiento, crea los elementos cuando son visibles no cuando sean invisibles
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => ExpenseItem(
        expenses[index],
      ),
    );
  }
}
