import 'package:flutter/material.dart';

class Endereco extends StatefulWidget {
  const Endereco({super.key});

  @override
  State<Endereco> createState() => _EnderecoPageState();
}

class _EnderecoPageState extends State<Endereco> {
  TextEditingController controllerCep = TextEditingController();
  TextEditingController controllerLogradouro = TextEditingController();
  TextEditingController controllerBairro = TextEditingController();
  TextEditingController controllerCidade = TextEditingController();
  TextEditingController controllerEstado = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('cadastro de endereço')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controllerCep,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "cep",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controllerLogradouro,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Logradouro",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controllerBairro,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Bairro",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controllerCidade,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Cidade",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: controllerEstado,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Estado",
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                print(controllerCep);
                print(controllerLogradouro);
                print(controllerBairro);
                print(controllerCidade);
                print(controllerEstado);
              },
              child: Text('Buscar'),
            ),
          ],
        ),
      ),
    );
  }
}
