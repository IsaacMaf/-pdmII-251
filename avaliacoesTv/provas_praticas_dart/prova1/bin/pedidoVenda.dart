import 'cliente.dart';
import 'vendedor.dart';
import 'veiculo.dart';
import 'itemPedido.dart';

class PedidoVenda {
  String codigo;
  DateTime data;
  double valorPedido;
  Cliente cliente;
  Vendedor vendedor;
  Veiculo veiculo;
  List<ItemPedido> itens;

  PedidoVenda({
    required this.codigo,
    required this.data,
    required this.valorPedido,
    required this.cliente,
    required this.vendedor,
    required this.veiculo,
    required this.itens,
  });

  double calcularPedido() {
    double totalItens = itens.fold(0.0, (sum, item) => sum + item.valor * item.quantidade);
    return veiculo.valor + totalItens;
  }

  Map<String, dynamic> toJson() => {
        'codigo': codigo,
        'data': data.toIso8601String(),
        'valorPedido': calcularPedido(),
        'cliente': cliente.toJson(),
        'vendedor': vendedor.toJson(),
        'veiculo': veiculo.toJson(),
        'itens': itens.map((e) => e.toJson()).toList(),
      };
}
