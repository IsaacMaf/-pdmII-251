import 'package:flutter/material.dart';

class CadastroForm extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final VoidCallback onSalvar;

  const CadastroForm({
    required this.label,
    required this.controller,
    required this.onSalvar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(labelText: label),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: onSalvar,
          child: Text('Cadastrar'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Voltar'),
        ),
      ],
    );
  }
}
