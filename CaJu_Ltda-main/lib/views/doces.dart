// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:projeto07/views/cardapio.dart';
import 'package:projeto07/views/detalhes.dart';
import 'package:projeto07/views/login.dart';
import 'package:projeto07/providers/categorias.dart';


// definindo a paleta
const Color vermelhoQueimado = Color(0xFF8A2F38);
const Color verde = Color(0xFF6E744D);
const Color bege = Color(0xFFC48C64);
const Color laranja = Color(0xFFB44134);
const Color fundoTela = Color(0xFFFFF6EC);

class Doces extends StatefulWidget {
  final String categoria;
  const Doces({super.key, required this.categoria});

  @override
  State<Doces> createState() => _DocesState();
}

class _DocesState extends State<Doces> {
  final FirestoreService _firestoreService = FirestoreService();  

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
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _firestoreService.getItensCardapio(widget.categoria),  
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar itens.'));
          }
          final itens = snapshot.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Doces',
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
                  itemCount: itens.length,
                  itemBuilder: (context, index) {
                    final item = itens[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              'detalhes',
                              arguments: item,
                            );
                          },
                          child: Container(
                            width: 350,
                            height: 200,
                            child: Image.network(
                              item['imagem'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Card(
                          elevation: 4,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: ListTile(
                            title: Text(
                              item['nome'],
                              style: TextStyle(fontSize: 20),
                            ),
                            trailing: Text(
                              'R\$ ${item['preco']}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                'detalhes',
                                arguments: item,
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
          );
        },
      ),
    );
  }
}
