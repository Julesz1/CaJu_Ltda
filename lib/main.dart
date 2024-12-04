import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto07/firebase_options.dart';
import 'package:projeto07/views/bebidasQuentes.dart';
import 'package:projeto07/views/bebidasfrias.dart';
import 'package:projeto07/views/cadastrar.dart';
import 'package:projeto07/views/cardapio.dart';
import 'package:projeto07/views/carrinhopg.dart';
import 'package:projeto07/views/detalhes.dart';
import 'package:projeto07/views/doces.dart';
import 'package:projeto07/views/login.dart';
import 'package:projeto07/views/salgados.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto07/services/carrinho.dart';

// definindo a paleta
const Color vermelhoQueimado = Color(0xFF8A2F38);
const Color verde = Color(0xFF6E744D);
const Color bege = Color(0xFFC48C64);
const Color laranja = Color(0xFFB44134);
const Color fundoTela = Color(0xFFFFF6EC);

void setupLocator() {
  GetIt.instance.registerSingleton<CarrinhoService>(CarrinhoService());
}

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        'login': (context) => Login(),
        'cardapio': (context) => Cardapio(),
        'bebidasQuentes': (context) => Bebidasquentes(),
        'bebidasFrias': (context) => Bebidasfrias(),
        'salgados': (context) => Salgados(),
        'doces': (context) => Doces(),
        'detalhes': (context) => Detalhes(),
        'carrinho': (context) => Carrinhopg(),
        'cadastro': (context) => Cadastrar(),
      },
    );
  }
}
