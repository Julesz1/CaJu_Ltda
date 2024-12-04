// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:projeto07/services/carrinho.dart'; 

final carrinhoService = getIt<CarrinhoService>();

class Carrinhopg extends StatefulWidget {
  const Carrinhopg({super.key});

  @override
  State<Carrinhopg> createState() => _CarrinhopgState();
}

class _CarrinhopgState extends State<Carrinhopg> {
  @override
  Widget build(BuildContext context) {
    final itensCarrinho = carrinhoService.itens;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFC48C64), 
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 80),
            Image.asset(
              'assets/images/logo_borda.png',
              width: 90,
              height: 90,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: itensCarrinho.length,
              itemBuilder: (context, index) {
                final item = itensCarrinho[index];
                return ListTile(
                  title: Text(item.nome),
                  subtitle: Text('Quantidade: ${carrinhoService.itens[index].quantidade}'), 
                  trailing: Text('R\$ ${item.preco.toStringAsFixed(2)}'),
                  leading: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      setState(() {

                        carrinhoService.removerItem(item);
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${item.nome} removido do carrinho!')),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Total: R\$ ${carrinhoService.total.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
              Container(
                height: 50,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Color(0xFFC48C64),
                      Color(0xFF8A2F38),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: SizedBox.expand(
                  child: TextButton(
                    onPressed: () {
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Finalizar Pedido",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
        ],
      ),
      backgroundColor: const Color(0xFFFFF6EC), 
    );
  }
}
