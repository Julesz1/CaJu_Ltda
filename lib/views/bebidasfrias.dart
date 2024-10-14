import 'package:flutter/material.dart';
import 'package:projeto07/models/cafeteria.dart';
import 'package:projeto07/models/pratos.dart';
import 'package:projeto07/views/cardapio.dart';
import 'package:projeto07/views/detalhes.dart';
import 'package:projeto07/views/login.dart';

class Bebidasfrias extends StatefulWidget {
  const Bebidasfrias({super.key});

  @override
  State<Bebidasfrias> createState() => _BebidasfriasState();
}

class _BebidasfriasState extends State<Bebidasfrias> {
    final cafeteria = Cafeteria();
  @override

  Widget build(BuildContext context) {
    final produto = cafeteria.items
        .where((prato) => prato.categoria == PratosCategoria.bebidasFrias)
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
                  MaterialPageRoute(
                      builder: (context) =>
                          Cardapio()),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            'Bebidas Frias',
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
                          bebida.imagem,
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
