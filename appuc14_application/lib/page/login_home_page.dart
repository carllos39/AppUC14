import 'package:appuc14_application/page/cadastro_page.dart';
import 'package:flutter/material.dart';

class LoginHomePage extends StatefulWidget {
  const LoginHomePage({super.key});

  @override
  State<LoginHomePage> createState() => _LoginHomePageState(); // Renomeado para clareza
}

class _LoginHomePageState extends State<LoginHomePage> {
  // ✅ Mantenha os Controllers
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerSenha = TextEditingController();

  @override
  void dispose() {
    // ✅ BOA PRÁTICA: Descartar controllers para liberar memória
    controllerEmail.dispose();
    controllerSenha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ⚠️ Ajuste de UI: Removendo o backgroundColor do Scaffold.
      // O Scaffold já usará o tema padrão (normalmente branco)
      // para focar no conteúdo de login. Se quiser um fundo azul, use o colorScheme.
      appBar: AppBar(
        title: const Text("Meus Projetos"),
        // 🎨 Ajuste de UI: Mudar a cor do AppBar se o Scaffold não for azul
        backgroundColor: Colors.blue,
      ),
      // ⚠️ UX: Usar SingleChildScrollView para evitar "overflow" (erro de espaço)
      // quando o teclado virtual aparecer.
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🖼️ Adicionando um ícone ou imagem (Opcional, mas melhora a UI)
            const Icon(Icons.lock_open, size: 80, color: Colors.blue),
            const SizedBox(height: 40),

            // --- Campo de Email ---
            TextField(
              controller: controllerEmail,
              // ✅ UX: Definindo o tipo de teclado para email
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Digite seu email",
              ),
            ),

            const SizedBox(height: 20),

            // --- Campo de Senha ---
            TextField(
              controller: controllerSenha,
              // ✅ UX: Ocultar o texto (já estava correto)
              obscureText: true,
              // ✅ UX: Definindo o tipo de teclado para texto (padrão para senhas)
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Digite a sua senha",
              ),
            ),
            const SizedBox(height: 15),

            // --- Botões ---
            // ⚠️ Ajuste de UI: O Column interno não é mais necessário e o SizedBox(width: 500)
            // é redundante com crossAxisAlignment: CrossAxisAlignment.stretch na Column principal.

            // Botão LOGAR
            ElevatedButton(
              onPressed: () {
                // Lógica de Login:
                final email = controllerEmail.text;
                final senha = controllerSenha.text;
                print('Email: $email, Senha: $senha');

                // TODO: Implementar a verificação de credenciais e navegação
              },
              // 🎨 UI: Adicionando estilo ao botão (ex: cor principal do tema)
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                "Logar",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),

            const SizedBox(height: 10),

            // Botão CADASTRAR (sem preenchimento)
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CadastroPage()),
                );
              },
              // 🎨 UI: Usando TextButton para dar menos destaque que o botão Logar
              child: const Text(
                "Cadastrar",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
