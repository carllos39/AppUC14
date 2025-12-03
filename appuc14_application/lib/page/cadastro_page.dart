import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroState();
}

class _CadastroState extends State<CadastroPage> {
  // 1. Criando controladores para capturar os dados
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Função que será chamada ao clicar em Cadastrar
  void _cadastrar() {
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;

    // TODO: Implementar a lógica de cadastro (ex: enviar para um backend)
    print('Nome: $name');
    print('Email: $email');
    print('Senha: $password');
  }

  @override
  void dispose() {
    // É uma boa prática descartar os controladores
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CadastroPage')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: SingleChildScrollView(
          // Adicionado para evitar overflow em teclados pequenos
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _nameController, // Vinculando o controlador
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite o seu nome',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _emailController, // Vinculando o controlador
                // Usando o teclado de email
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite o seu email',
                ),
              ),
              const SizedBox(height: 10),
              // CAMPO DA SENHA CORRIGIDO:
              TextField(
                controller: _passwordController, // Vinculando o controlador
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite a sua senha',
                ),
                // Oculta a senha
                obscureText: true,
                // Define o tipo de teclado como texto padrão
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _cadastrar, // Chamando a função de cadastro
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
