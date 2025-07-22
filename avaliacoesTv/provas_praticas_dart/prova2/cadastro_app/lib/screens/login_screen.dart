import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final _loginController = TextEditingController();
  final _senhaController = TextEditingController();

  void _autenticar(BuildContext context) {
    final login = _loginController.text;
    final senha = _senhaController.text;
    if (login == 'admin' && senha == '123') {
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login inválido')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _loginController, decoration: InputDecoration(labelText: 'Login')),
            TextField(controller: _senhaController, decoration: InputDecoration(labelText: 'Senha'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => _autenticar(context), child: Text('Entrar'))
          ],
        ),
      ),
    );
  }
}
