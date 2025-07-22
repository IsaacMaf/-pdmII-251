import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  void navegar(BuildContext context, String rota) {
    Navigator.of(context).pushNamed(rota);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu Principal')),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          ElevatedButton(onPressed: () => navegar(context, '/clientes'), child: Text('Clientes')),
          ElevatedButton(onPressed: () => navegar(context, '/produtos'), child: Text('Produtos')),
          ElevatedButton(onPressed: () => navegar(context, '/fornecedores'), child: Text('Fornecedores')),
          ElevatedButton(onPressed: () => navegar(context, '/pedidos'), child: Text('Pedidos')),
        ],
      ),
    );
  }
}
