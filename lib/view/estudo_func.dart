import 'package:first_app/view/show_users_screen.dart';
import 'package:first_app/models/user_model.dart';
import 'package:flutter/material.dart';

class EstudoFuncScreen extends StatelessWidget {
  EstudoFuncScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<UserModel> users = [];

    void mostrarInfo() {
      users.add(UserModel(
          name: ageController.text,
          idade: int.tryParse(ageController.text) ?? 0));

      print(users[0].anoNascimento());
      print(users.length);
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Insira o seu nome',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: ageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Insira a sua idade',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  mostrarInfo();
                },
                child: const Text('Salvar'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (users.isNotEmpty) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ShowUsersScreen(users: users)));
                  } else {
                    const snackBar = SnackBar(
                      content: Text('Insira, pelo menos, 1 usuario'),
                      backgroundColor: Colors.red,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: const Text('Mostrar'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
