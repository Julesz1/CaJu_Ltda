// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:projeto07/main.dart';
import 'package:projeto07/models/cafeteria.dart';
import 'package:projeto07/models/pratos.dart';
import 'package:projeto07/views/itemDetalhe.dart';
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
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                         MaterialPageRoute(builder: (context) => Itemdetalhe(item: bebidasQuentes[index])));
                      },
                      child: Container(
                        color: Colors.white,
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        height: 120,
                        child: Row(
                          children: [
                            Image.asset(
                              bebida.imagem,
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 20),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  bebida.nome,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'R\$ ${bebida.preco.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: vermelhoQueimado,
                      endIndent: 25,
                      indent: 25,
                    )
                  ],
                );
              },
            )),
          ])),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, top: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'cardapio');
              },
              child: Text(
                'Voltar ao Cardápio Principal',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: fundoTela,
    );
  }
}
