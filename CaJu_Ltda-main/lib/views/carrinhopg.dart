// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto07/services/carrinho.dart';

class Carrinhopg extends StatefulWidget {
  const Carrinhopg({super.key});

  @override
  State<Carrinhopg> createState() => _CarrinhopgState();
}

class _CarrinhopgState extends State<Carrinhopg> {
  final carrinhoService = getIt<CarrinhoService>();

  @override
  Widget build(BuildContext context) {
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
              itemCount: carrinhoService.itens.length,
              itemBuilder: (context, index) {
                final item = carrinhoService.itens[index];

                return ListTile(
                  title: Text(item['nome']),
                  subtitle: Text('Quantidade: ${item['quantidade']}'),
                  trailing: Text('R\$ ${item['preco'].toStringAsFixed(2)}'),
                  leading: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      setState(() {
                        carrinhoService.removerItem(item);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Total: R\$ ${carrinhoService.total.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await PedidoService().finalizarPedido(carrinhoService.itens);

                setState(() {
                  carrinhoService.itens.clear();
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Pedido realizado com sucesso!')),
                );

                Navigator.of(context).pop();
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Erro ao finalizar o pedido: $e')),
                );
              }
            },
            child: Text('Finalizar Pedido'),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFFFF6EC),
    );
  }
}
