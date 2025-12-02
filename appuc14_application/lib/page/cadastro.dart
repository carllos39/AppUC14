import 'package:appuc14_application/model/usuario.dart';
import 'package:appuc14_application/page/login.dart';
import 'package:appuc14_application/service/usuario_service.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Cadastro> {
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FirebaseService _firebaseService = FirebaseService(
    collectionName: "usuarios",
  );

  Future<void> salvarUsuario() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    Usuario usuario = Usuario(
      id: "",
      nome: controllerNome.text,
      email: controllerEmail.text,
      senha: controllerSenha.text,
    );

    try {
      String idUser = await _firebaseService.create(usuario.toMap());

      if (idUser.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Column(
              children: [
                Text(
                  "Sucesso: $idUser",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Usuário cadastrado com sucesso!",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text("Meus Projetos")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controllerNome,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Digite o seu nome",
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controllerSenha,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Digite o seu email",
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controllerEmail,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Digite a sua senha",
              ),
            ),

            SizedBox(height: 15),
            Column(
              children: [
                SizedBox(
                  width: 500,
                  child: ElevatedButton(
                    onPressed: () {
                      print(controllerNome.text);
                      print(controllerEmail.text);
                      print(controllerSenha.text);
                    },
                    child: Text("Cadastrar"),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginHomePage()),
                    );
                  },
                  child: Text("Logar"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
