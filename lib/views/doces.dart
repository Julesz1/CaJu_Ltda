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

class Doces extends StatefulWidget {
  const Doces({super.key});

  @override
  State<Doces> createState() => _DocesState();
}

class _DocesState extends State<Doces> {
  final cafeteria = Cafeteria();

  @override
    Widget build(BuildContext context) {
    final produtos = cafeteria.items
        .where((prato) => prato.categoria == PratosCategoria.doces)
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
                          const Cardapio()),
                );
              },
              child: Image.asset(
                'assets/images/logo_borda.png',
                width: 70,
                height: 70,
              ),
            ),
            const Text(
              'MENU',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              color: Colors.white,
              iconSize: 28,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Doces',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.brown,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                final bebida = produtos[index];
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
                      child: SizedBox(
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
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListTile(
                        title: Text(
                          bebida.nome,
                          style: const TextStyle(fontSize: 20),
                        ),
                        trailing: Text(
                          'R\$ ${bebida.preco.toStringAsFixed(2)}',
                          style: const TextStyle(
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
                    const SizedBox(height: 30),
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
