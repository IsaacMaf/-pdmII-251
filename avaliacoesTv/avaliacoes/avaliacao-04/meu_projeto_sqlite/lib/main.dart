import 'dart:io';
import 'package:sqflite/sqflite.dart';

void main() async {
    final db = await openDatabase('alunos.db');

    // Criação da tabela TB_ALUNO
    await db.execute('''
    CREATE TABLE IF NOT EXISTS TB_ALUNO (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT NOT NULL
    );
    ''');

    while (true) {
        print('Digite o nome do aluno (ou "sair" para encerrar):');
        String? nome = stdin.readLineSync();

        if (nome == null || nome.toLowerCase() == 'sair') {
            break;
        }

        // Inserindo dados na tabela
        await db.execute('INSERT INTO TB_ALUNO (nome) VALUES (?);', [nome]);
        print('Aluno $nome adicionado com sucesso!');
    }

    // Lendo e apresentando os dados da tabela
    print('Lista de alunos:');
    final List<Map<String, dynamic>> result = await db.query('TB_ALUNO');
    for (final Map<String, dynamic> row in result) {
        print('ID: ${row['id']}, Nome: ${row['nome']}');
    }

    await db.close();
}