import 'dart:convert';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

import 'cliente.dart';
import 'vendedor.dart';
import 'veiculo.dart';
import 'itemPedido.dart';
import 'pedidoVenda.dart';

void main() async {
  // Criar objetos com dados de exemplo
  var cliente = Cliente(codigo: 1, nome: 'Isaac Ramos', tipoCliente: 2);
  var vendedor = Vendedor(codigo: 101, nome: 'Capitão Taveira', comissao: 0.05);
  var veiculo = Veiculo(codigo: 1001, descricao: 'Toyota Corolla XEi 2.0', valor: 115000.0);

  var itens = [
    ItemPedido(sequencial: 1, descricao: 'Ar-condicionado digital', quantidade: 1, valor: 3500.0),
    ItemPedido(sequencial: 2, descricao: 'Som automotivo JBL', quantidade: 1, valor: 2500.0),
    ItemPedido(sequencial: 3, descricao: 'Película anti-vandalismo', quantidade: 1, valor: 900.0),
  ];

  var pedido = PedidoVenda(
    codigo: 'PV2025-001',
    data: DateTime.now(),
    valorPedido: 0.0, // será calculado automaticamente
    cliente: cliente,
    vendedor: vendedor,
    veiculo: veiculo,
    itens: itens,
  );

  String jsonData = jsonEncode(pedido.toJson());

  // Configuração do SMTP
  final smtpServer = gmail('isaac.magalhaes07@aluno.ifce.edu.br', 'jffd ttem bocr zujr');

  final message = Message()
    ..from = Address('isaac.magalhaes07@aluno.ifce.edu.br', 'Isaac Ramos')
    ..recipients.add('taveira@ifce.edu.br')
    ..subject = 'JSON do Pedido de Venda - Projeto Revenda'
    ..text = 'Segue em anexo o JSON do Pedido de Venda:\n\n$jsonData';

  try {
    final sendReport = await send(message, smtpServer);
    print('E-mail enviado com sucesso: ${sendReport}');
  } on MailerException catch (e) {
    print('Erro ao enviar e-mail: $e');
  }
}
