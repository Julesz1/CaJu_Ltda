 // ignore_for_file: prefer_const_constructors, unused_import

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:projeto07/models/cafeteria.dart';
import 'package:projeto07/models/pratos.dart';
import 'package:projeto07/providers/carrinho_provider.dart';
import 'package:projeto07/views/bebidasQuentes.dart';
import 'package:projeto07/views/bebidasfrias.dart';
import 'package:projeto07/views/cardapio.dart';
import 'package:projeto07/views/carrinhopg.dart';
import 'package:projeto07/views/detalhes.dart';
import 'package:projeto07/views/doces.dart';
import 'package:projeto07/views/login.dart';
import 'package:projeto07/views/salgados.dart';
import 'package:provider/provider.dart';
 
//definindo a paleta
const Color vermelhoQueimado = Color(0xFF8A2F38);
const Color verde = Color(0xFF6E744D);
const Color bege = Color(0xFFC48C64);
const Color laranja = Color(0xFFB44134);
const Color fundoTela = Color(0xFFFFF6EC);

//lista global do carrinho de compras
//List<Pratos> carrinho = [];

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cafeteria()),
        ChangeNotifierProvider(create: (context) => CarrinhoProvider()),
      ],
      child: DevicePreview(
          enabled: true,
          builder: (context) => MainApp(),
        ),
    ),
  );
}
 
class MainApp extends StatelessWidget {
  const MainApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bebidasquentes(),
      routes: {
        'login': (context) => Login(),
        'cardapio': (context) => Cardapio(),
        'bebidasQuentes': (context) => Bebidasquentes(),
        'bebidasFrias': (context) => Bebidasfrias(),
        'salgados': (context) => Salgados(),
        'doces': (context) => Doces(),
        'detalhes': (context) => Detalhes(),
        'carrinho': (context) => Carrinhopg(),
      },
    );
  }
}
