class ItemPedido {
  int sequencial;
  String descricao;
  int quantidade;
  double valor;

  ItemPedido({required this.sequencial, required this.descricao, required this.quantidade, required this.valor,});

  Map<String, dynamic> toJson() => {
        'sequencial': sequencial,
        'descricao': descricao,
        'quantidade': quantidade,
        'valor': valor,
      };
}