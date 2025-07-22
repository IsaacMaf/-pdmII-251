import 'package:flutter/material.dart';

class CadastroList extends StatelessWidget {
  final List<String> itens;

  const CadastroList({required this.itens});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itens.length,
      itemBuilder: (ctx, i) => ListTile(title: Text(itens[i])),
    );
  }
}
