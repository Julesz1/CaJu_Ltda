// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:projeto07/main.dart';
import 'package:projeto07/models/cafeteria.dart';
import 'package:projeto07/models/pratos.dart';
import 'package:projeto07/views/login.dart';

class Bebidasquentes extends StatefulWidget {
  const Bebidasquentes({super.key});

  @override
  State<Bebidasquentes> createState() => _BebidasquentesState();
}

class _BebidasquentesState extends State<Bebidasquentes> {
  final cafeteria = Cafeteria();
  @override
  Widget build(BuildContext context) {
    final bebidasQuentes = cafeteria.items
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
            Image.asset(
              'assets/images/logo_borda.png',
              width: 90,
              height: 90,
            ),
            Text(
              'Café CaJu',
              style: TextStyle(
                fontFamily:
                    'Arial', //descobrir qual fonte mais combina com o nome e importar depois no yaml
                fontSize: 20,
              ),
            ),
            IconButton(
              icon: Icon(Icons.logout),
              color: Colors.black,
              iconSize: 28,
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                )
              },
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Text(
            'Bebidas Quentes',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
                child: ListView.builder(
              itemCount: bebidasQuentes.length,
              itemBuilder: (context, index) {
                final bebida = bebidasQuentes[index];
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    leading: Image.asset(
                      bebida.imagem,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(bebida.nome),
                    trailing: Text(
                      'R\$ ${bebida.preco.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            )),
          ]))
        ],
      ),
    );
  }
}
