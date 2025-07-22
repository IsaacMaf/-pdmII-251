import 'package:flutter/material.dart';

class DadosProvider extends ChangeNotifier {
  List<String> clientes = [];
  List<String> produtos = [];
  List<String> fornecedores = [];
  List<String> pedidos = [];

  void adicionar(String tipo, String valor) {
    switch (tipo) {
      case 'cliente': clientes.add(valor); break;
      case 'produto': produtos.add(valor); break;
      case 'fornecedor': fornecedores.add(valor); break;
      case 'pedido': pedidos.add(valor); break;
    }
    notifyListeners();
  }

  List<String> listar(String tipo) {
    switch (tipo) {
      case 'cliente': return clientes;
      case 'produto': return produtos;
      case 'fornecedor': return fornecedores;
      case 'pedido': return pedidos;
      default: return [];
    }
  }
}
