// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:projeto07/main.dart';
import 'package:projeto07/views/bebidasfrias.dart';
import 'package:projeto07/views/bebidasquentes.dart';
import 'package:projeto07/views/carrinhopg.dart';
import 'package:projeto07/providers/categorias.dart';
import 'package:projeto07/views/doces.dart';
import 'package:projeto07/views/salgados.dart';

class Cardapio extends StatefulWidget {
  const Cardapio({super.key});

  @override
  State<Cardapio> createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {
   final FirestoreService _firestoreService = FirestoreService();

   final Map<String, Widget Function(BuildContext)> categoriasMap = {
    'Bebidas Quentes': (context) => Bebidasquentes(categoria: 'Bebidas Quentes'),
    'Bebidas Frias': (context) => Bebidasfrias(categoria: 'Bebidas Frias'),
    'Doces': (context) => Doces(categoria: 'Doces',),
    'Salgados': (context) => Salgados(categoria: 'Salgados',),
   };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Color(0xFFC48C64),
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
     body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _firestoreService.getCategorias(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError){
            return Center(child: Text('Erro ao carregar categorias'));
          }

          final categorias = snapshot.data!;
          return Column(
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
                child: ListView.builder(
                  itemCount: categorias.length,
                  itemBuilder: (context, index) {
                    final categoria = categorias[index];

                    final String imagePath = categoria['imagem'] ?? 'assets/images/default.png';

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      child: Card(
                        color: Color.fromARGB(125, 136, 84, 12),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          leading: Image.asset(
                            imagePath,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            categoria['nome'],
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            categoria['descricao'],
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {
                            final pageBuilder = categoriasMap[categoria['nome']];
                            if (pageBuilder != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: pageBuilder),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Categoria não encontrada')),
                              );
                            }
                          },
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        }
     ),
      backgroundColor: Color(0xFFFFF6EC),
    );
  }
}
