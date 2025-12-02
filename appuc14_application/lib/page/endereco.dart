import 'package:appuc14_application/service/via_cep_service.dart';
import 'package:flutter/material.dart';
import 'package:appuc14_application/model/endereco.dart';

class EnderecoPage extends StatefulWidget {
  const EnderecoPage({super.key});

  @override
  State<EnderecoPage> createState() => _EnderecoPageState();
}

class _EnderecoPageState extends State<EnderecoPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController controllerCep = TextEditingController();
  final TextEditingController controllerLogradouro = TextEditingController();
  final TextEditingController controllerBairro = TextEditingController();
  final TextEditingController controllerCidade = TextEditingController();
  final TextEditingController controllerEstado = TextEditingController();

  Endereco? endereco;
  bool isLoading = false;

  final ViaCepService viaCepService = ViaCepService();

  Future<void> buscarCep(String cep) async {
    if (!_formKey.currentState!.validate()) return;

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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Erro ao buscar CEP: $erro")));
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
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  maxLength: 8,
                  controller: controllerCep,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "CEP",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Informe o CEP";
                    }
                    if (value.length != 8) {
                      return "O CEP deve ter 8 números";
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return "Digite apenas números";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10),
                TextFormField(
                  controller: controllerLogradouro,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Logradouro",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo obrigatório";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10),
                TextFormField(
                  controller: controllerBairro,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Bairro",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo obrigatório";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10),
                TextFormField(
                  controller: controllerCidade,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Cidade",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo obrigatório";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10),
                TextFormField(
                  controller: controllerEstado,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Estado",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Campo obrigatório";
                    }
                    if (value.length != 2) {
                      return "Use a sigla do estado (ex: SP)";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () => buscarCep(controllerCep.text),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Buscar CEP'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
