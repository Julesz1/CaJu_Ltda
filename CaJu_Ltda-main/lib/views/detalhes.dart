// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projeto07/services/carrinho.dart';
import 'package:projeto07/models/contador.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Definindo a paleta de cores
const Color vermelhoQueimado = Color(0xFF8A2F38);
const Color verde = Color(0xFF6E744D);
const Color bege = Color(0xFFC48C64);
const Color laranja = Color(0xFFB44134);
const Color fundoTela = Color(0xFFFFF6EC);

class Detalhes extends StatefulWidget {
  const Detalhes({super.key});

  @override
  State<Detalhes> createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  final GlobalKey<ContadorState> _contadorKey = GlobalKey<ContadorState>();

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> prato = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: fundoTela,
      appBar: AppBar(
        backgroundColor: bege,
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    width: double.infinity,
                    child: Image.asset(
                      prato['imagem'],
                      fit: BoxFit.cover,
                      height: 300,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      prato['nome'],
                      style: TextStyle(
                        fontSize: 24,
                        color: vermelhoQueimado,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Descrição',
                      style: TextStyle(fontSize: 12),
                    ),
                    subtitle: Text(
                      prato['descricao'],
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Preço:',
                      style: TextStyle(fontSize: 12),
                    ),
                    subtitle: Text(
                      'R\$ ${prato['preco'].toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
            Contador(key: _contadorKey),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    int quantidade = _contadorKey.currentState?.getQuantidade() ?? 1;

                    final item = {
                      'nome': prato['nome'],
                      'preco': prato['preco'],
                      'quantidade': quantidade,
                    };

                    Provider.of<CarrinhoService>(context, listen: false)
                        .adicionarItem(item, quantidade);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${prato['nome']} adicionado ao pedido!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 203, 117, 47),
                    foregroundColor: fundoTela,
                    minimumSize: Size(double.infinity, 60),
                  ),
                  child: Text(
                    'Adicionar ao carrinho',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
