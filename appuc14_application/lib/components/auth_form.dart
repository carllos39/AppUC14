import 'package:appuc14_application/page/model/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key, required onSubmit});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>(); //Acessando dados do formulário
  final _formData = AuthFormData(); //Usando a classe que foi criada

  void _submit() {
    _formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                if (_formData.isSignup)
                  TextFormField(
                    key: const ValueKey('nome'),
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Informe o nome';
                      }
                      if (value.trim().length < 3) {
                        return 'Nome deve ter no minimo 3 caracteres';
                      }
                    },
                  ),
                TextFormField(
                  key: const ValueKey('Email'),
                  initialValue: _formData.nome,
                  onChanged: (email) => _formData.email = email,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe o email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Informe um email válido';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  key: const ValueKey('password'),
                  initialValue: _formData.nome,
                  onChanged: (password) => _formData.senha = password,
                  decoration: const InputDecoration(labelText: 'Senha'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe a senha';
                    }
                    if (value.trim().length < 3) {
                      return 'Nome deve ter no minimo 4 caracteres';
                    }
                  },
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: _submit,
                  child: Text(_formData.isSignup ? 'Logar' : 'Cadastrar'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _formData.toggleAuthMode();
                    });
                  },
                  child: Text(
                    _formData.isLogin
                        ? 'Criar uma nova conta'
                        : 'Já possui conta',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
