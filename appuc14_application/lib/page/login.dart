import 'package:appuc14_application/page/cadastro.dart';
import 'package:appuc14_application/service/auth_sevice.dart';
import 'package:flutter/material.dart';

class LoginHomePage extends StatefulWidget {
  const LoginHomePage({super.key});

  @override
  State<LoginHomePage> createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerSenha = TextEditingController();

  bool loading = false;

  void fazerLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => loading = true);

    try {
      final auth = AuthService();
      final user = await auth.login(
        controllerEmail.text,
        controllerSenha.text,
      );

      if (user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login realizado com sucesso!")),
        );

        // Aqui navega para a Home Page
        Navigator.pushReplacementNamed(context, "/home");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro: $e")),
      );
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text("Meus Projetos"),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controllerEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Digite seu email",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Informe o email";
                  }
                  if (!RegExp(r"^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$")
                      .hasMatch(value)) {
                    return "Email inválido";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: controllerSenha,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Digite a sua senha",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Informe a senha";
                  }
                  if (value.length < 6) {
                    return "A senha deve ter no mínimo 6 caracteres";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: 500,
                child: ElevatedButton(
                  onPressed: loading ? null : fazerLogin,
                  child: loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Logar"),
                ),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Cadastro()),
                  );
                },
                child: const Text("Cadastrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

