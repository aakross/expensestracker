import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  //var _enteredTittle = ''; //Aqui se esta iniciando el titulo vacio y se manda a llamar en _saveTittleInput

  // void _saveTittleInput(String inputValue) {
  //   _enteredTittle =
  //       inputValue; //Aqui el campo ya se le asigno un titulo y guardara ese valor
  // }

// Se utilizo TextEditingController ya que flutter maneja mejor el como se guarda lo que el usuario escribio
  final _tittleController = TextEditingController();
  final _amountController = TextEditingController();
  //Aqui se le esta diciendo a Dart que _selectedDate puede contener nada o un valor tipo DateTime
  DateTime? _selectedDate;

  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    //Aqui se le esta agregando el dia actual menos un año
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    //Los async await se pueden utilizar tambien en metodos futuros como showDatePicker
    final pickDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = pickDate;
    });
  }

//dispose sirve para cerrar el campo textfield de la UI en este caso cerrarlo cuando el modal este abierto
  @override
  void dispose() {
    _amountController.dispose();
    _tittleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _tittleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Tittle'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No date selected'
                          //El signo de ! se le agrego ya que dart intuye que sera null pero con ! se le forza porque sabemos que por el operador ternario que no sera asi, en pocas palbaras le decimos a dart que no sera null
                          : formatter.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              //Items quiere una lista por eso se le agrega el map para transformarla en lista
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          //Aqui _selectedCategory servira para guardar internamente el valor seleccionado
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    //Aqui se esta verificando si value es Null en dado caso se returna y si no cambia el estado por el acutal
                    if (value == null) {
                      return;
                    }
                    //Si es nulo no se ejecutara el siguiente codigo
                    setState(() {
                      _selectedCategory = value;
                    });
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_tittleController.text);
                  print(_amountController.text);
                },
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
