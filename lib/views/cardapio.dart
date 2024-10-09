// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:projeto07/main.dart';
import 'package:projeto07/views/login.dart';

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
                fontFamily: 'Arial', //descobrir qual fonte mais combina com o nome e importar depois no yaml
                fontSize: 20,
              ),
              ),
            IconButton(
              icon: Icon(Icons.logout),
              color: Colors.black,
              iconSize: 28,
              onPressed: () => {
                Navigator.push(context,
                 MaterialPageRoute(builder:
                 (context) => Login()
                 ),
                )
              },
            )
          ],
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 150,
                        child:  Card(
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical:3, horizontal: 8),
                            leading: Image.asset(
                              'assets/images/hot_drinks.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              ),  
                              title: Text('Bebidas Quentes'),
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
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                            leading: Image.asset(
                              'assets/images/cold_drinks.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text('Bebidas Frias'),
                            onTap: () {
                              Navigator.pushNamed(context, 'bebidasFrias');
                            },
                          ),
                        ),
                      ),       
                    ],
                  )
                )
              ],
            )
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 150,
                        child: Card(
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                            leading: Image.asset(
                              'assets/images/pastry.jpeg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text('Salgados'),
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
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                            leading: Image.asset(
                              'assets/images/doces.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text('Doces'),
                            onTap: () {
                              Navigator.pushNamed(context, 'doces');
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                )
              ],
            )
          )
        ],
      ),
      
      backgroundColor: fundoTela,
    );
  }
}
