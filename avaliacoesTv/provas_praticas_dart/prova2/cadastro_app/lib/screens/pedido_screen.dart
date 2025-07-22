import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dados_provider.dart';

class PedidoScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dados = Provider.of<DadosProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Pedidos')),
      body: PageView(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(labelText: 'Descrição do Pedido'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    dados.adicionar('pedido', _controller.text);
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
            itemCount: dados.pedidos.length,
            itemBuilder: (ctx, i) => ListTile(title: Text(dados.pedidos[i])),
          ),
        ],
      ),
    );
  }
}
