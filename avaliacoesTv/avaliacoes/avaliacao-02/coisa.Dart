import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(this._nome);

  Map<String, dynamic> toJson() {
    return {'nome': _nome};
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(this._nome, this._dependentes);

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
      'dependentes': _dependentes.map((d) => d.toJson()).toList(),
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(this._nomeProjeto, this._funcionarios);

  Map<String, dynamic> toJson() {
    return {
      'nome_projeto': _nomeProjeto,
      'funcionarios': _funcionarios.map((f) => f.toJson()).toList(),
    };
  }
}

var dep1 = Dependente('Clarêncio');
var dep2 = Dependente('Kratos');
var dep3 = Dependente('DaveDoidao');

var fun1 = Funcionario('Steve', [dep1, dep2]);
var fun2 = Funcionario('BuzzLightYear', [dep3]);

var funcionarios = [fun1, fun2];

var equipe = EquipeProjeto('Projeto TinyWhispers', funcionarios);


void main() {
  var jsonEquipe = jsonEncode(equipe.toJson());
  print(jsonEquipe);
}