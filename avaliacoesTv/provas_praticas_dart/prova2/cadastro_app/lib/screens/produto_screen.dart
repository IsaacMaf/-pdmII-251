import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dados_provider.dart';

class ProdutoScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dados = Provider.of<DadosProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Produtos')),
      body: PageView(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(labelText: 'Nome do Produto'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    dados.adicionar('produto', _controller.text);
                    _controller.clear();
                  },
                  child: Text('Cadastrar'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Voltar'),
                ),
              ],
            ),
          ),
          ListView.builder(
            itemCount: dados.produtos.length,
            itemBuilder: (ctx, i) => ListTile(title: Text(dados.produtos[i])),
          ),
        ],
      ),
    );
  }
}
