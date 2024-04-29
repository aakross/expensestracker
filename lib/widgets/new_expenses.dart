import 'package:flutter/material.dart';

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

//dispose sirve para cerrar el campo textfield de la UI en este caso cerrarlo cuando el modal este abierto
  @override
  void dispose() {
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
              ElevatedButton(
                onPressed: () {
                  print(_tittleController.text);
                },
                child: const Text('Save Expense'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
