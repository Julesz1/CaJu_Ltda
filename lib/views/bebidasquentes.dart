// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:projeto07/models/cafeteria.dart';
import 'package:projeto07/models/pratos.dart';
import 'package:projeto07/views/cardapio.dart';
import 'package:projeto07/views/login.dart';

//definindo a paleta
const Color vermelhoQueimado = Color(0xFF8A2F38);
const Color verde = Color(0xFF6E744D);
const Color bege = Color(0xFFC48C64);
const Color laranja = Color(0xFFB44134);
const Color fundoTela = Color(0xFFFFF6EC);

class Bebidasquentes extends StatefulWidget {
  const Bebidasquentes({super.key});

  @override
  State<Bebidasquentes> createState() => _BebidasquentesState();
}

class _BebidasquentesState extends State<Bebidasquentes> {
  final cafeteria = Cafeteria();
  
  @override
  Widget build(BuildContext context) {
    final produto = cafeteria.items
        .where((prato) => prato.categoria == PratosCategoria.bebidasQuentes)
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bege,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cardapio()),
                );
              },
              child: Image.asset(
                'assets/images/logo_borda.png',
                width: 70,
                height: 70,
              ),
            ),
            Text(
              'MENU',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(Icons.logout),
              color: Colors.white,
              iconSize: 28,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ],
        ),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            'Bebidas Quentes',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: produto.length,
              itemBuilder: (context, index) {
                final bebida = produto[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          'detalhes',
                          arguments: bebida,
                        );
                      },
                      child: Container(
                        width: 350, 
                        height: 200,
                        child: Image.asset(
                          bebida.getImagem(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Card(
                      elevation: 4,
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: ListTile(
                        title: Text(
                          bebida.nome,
                          style: TextStyle(fontSize: 20),
                        ),
                        trailing: Text(
                          'R\$ ${bebida.preco.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            'detalhes',
                            arguments: bebida,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
