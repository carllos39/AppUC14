import 'package:appuc14_application/service/via_cep_service.dart';
import 'package:flutter/material.dart';
import 'package:appuc14_application/model/endereco.dart'; // <-- Modelo correto

class EnderecoPage extends StatefulWidget {
  const EnderecoPage({super.key});

  @override
  State<EnderecoPage> createState() => _EnderecoPageState();
}

class _EnderecoPageState extends State<EnderecoPage> {
  final TextEditingController controllerCep = TextEditingController();
  final TextEditingController controllerLogradouro = TextEditingController();
  final TextEditingController controllerBairro = TextEditingController();
  final TextEditingController controllerCidade = TextEditingController();
  final TextEditingController controllerEstado = TextEditingController();

  Endereco? endereco;
  bool isLoading = false;

  final ViaCepService viaCepService = ViaCepService();

  Future<void> buscarCep(String cep) async {
    clearControllers();

    setState(() => isLoading = true);

    try {
      Endereco? response = await viaCepService.buscarEndereco(cep);

      if (response == null || response.logradouro == null) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            icon: Icon(Icons.warning),
            title: Text("Atenção"),
            content: Text("CEP não encontrado"),
          ),
        );
        controllerCep.clear();
        return;
      }

      setState(() => endereco = response);

      setControllersCep(endereco!);

    } catch (erro) {
      throw Exception("Erro ao buscar CEP: $erro");
    } finally {
      setState(() => isLoading = false);
    }
  }

  void setControllersCep(Endereco e) {
    controllerLogradouro.text = e.logradouro ?? "";
    controllerBairro.text = e.bairro ?? "";
    controllerCidade.text = e.localidade ?? "";
    controllerEstado.text = e.uf ?? "";
  }

  void clearControllers() {
    controllerLogradouro.clear();
    controllerBairro.clear();
    controllerCidade.clear();
    controllerEstado.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Endereço')),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controllerCep,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "CEP",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controllerLogradouro,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Logradouro",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controllerBairro,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Bairro",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controllerCidade,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Cidade",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: controllerEstado,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Estado",
              ),
            ),
            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {
                buscarCep(controllerCep.text);
              },
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Buscar'),
            ),
          ],
        ),
      ),
    );
  }
}

