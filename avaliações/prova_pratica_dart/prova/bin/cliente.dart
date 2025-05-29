class Cliente {
  int codigo;
  String nome;
  int tipoCliente;

  Cliente({required this.codigo, required this.nome, required this.tipoCliente});

  Map<String, dynamic> toJson() => {
    'codigo': codigo,
    'nome': nome,
    'tipoCliente': tipoCliente,
  };
}
