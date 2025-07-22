import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/cliente_screen.dart';
import 'screens/produto_screen.dart'; // criar similares
import 'screens/fornecedor_screen.dart';
import 'screens/pedido_screen.dart';
import 'providers/dados_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => DadosProvider(),
      child: MaterialApp(
        title: 'Cadastro App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => LoginScreen(),
          '/home': (context) => HomeScreen(),
          '/clientes': (context) => ClienteScreen(),
          '/produtos': (context) => ProdutoScreen(),
          '/fornecedores': (context) => FornecedorScreen(),
          '/pedidos': (context) => PedidoScreen(),
        },
      ),
    ),
  );
}
