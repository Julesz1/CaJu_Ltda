// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:projeto07/main.dart';
import 'package:projeto07/views/carrinhopg.dart';

class Cardapio extends StatefulWidget {
  const Cardapio({super.key});

  @override
  State<Cardapio> createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {
  @override
  Widget build(BuildContext context) {
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
              icon: Icon(Icons.shopping_cart),
              color: Colors.black,
              iconSize: 28,
              onPressed: () async => {
               await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Carrinhopg()),
                ),
                setState(() {     
                }),
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40),
          Text(
            'Cardápio',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                children: [
                  Expanded(
                      child: ListView(
                    children: [
                      SizedBox(height: 10),
                      SizedBox(
                        height: 80,
                        width: 150,
                        child: Card(
                          color: Color.fromARGB(185, 94, 58, 6),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 8),
                            leading: Image.asset(
                              'assets/images/hot_drinks.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              'Bebidas Quentes',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, 'bebidasQuentes');
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: 150,
                        child: Card(
                          color: Color.fromARGB(185, 94, 58, 6),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            leading: Image.asset(
                              'assets/images/cold_drinks.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              'Bebidas Frias',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, 'bebidasFrias');
                            },
                          ),
                        ),
                      ),
                    ],
                  ))
                ],
              )),
              SizedBox(width: 10),
              Expanded(
                  child: Column(
                children: [
                  Expanded(
                      child: ListView(
                    children: [
                      SizedBox(height: 10),
                      SizedBox(
                        height: 80,
                        width: 150,
                        child: Card(
                          color: Color.fromARGB(185, 94, 58, 6),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            leading: Image.asset(
                              'assets/images/pastry.jpeg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              'Salgados',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, 'salgados');
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: 150,
                        child: Card(
                          color: Color.fromARGB(185, 94, 58, 6),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            leading: Image.asset(
                              'assets/images/doces.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              'Doces',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, 'doces');
                            },
                          ),
                        ),
                      ),
                    ],
                  ))
                ],
              ))
            ],
          ))
        ],
      ),
      backgroundColor: fundoTela,
    );
  }
}
