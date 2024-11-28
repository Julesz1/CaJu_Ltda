// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projeto07/services/carrinho.dart';

class Carrinhopg extends StatelessWidget {
  const Carrinhopg({super.key});

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
      body: Consumer<CarrinhoService>(
        builder: (context, carrinhoService, child) {
          if (carrinhoService.itens.isEmpty) {
            return Center(child: Text('Seu carrinho está vazio!'));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: carrinhoService.itens.length,
                  itemBuilder: (context, index) {
                    final item = carrinhoService.itens[index];

                    return ListTile(
                      title: Text(item['nome']),
                      subtitle: Text('Quantidade: ${item['quantidade']}'),
                      trailing: Text('R\$ ${item['preco_total'].toStringAsFixed(2)}'),
                      leading: IconButton(
                        onPressed: () {
                          carrinhoService.removerItem(item);
                        },
                        icon: Icon(Icons.remove_circle_outline),
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
      onPressed: () async {
        try {
          await carrinhoService.finalizarPedido();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Pedido realizado com sucesso!')),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Erro ao finalizar pedido')),
          );
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Finalizar Pedido",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  ),
),

            ],
          );
        },
      ),
      backgroundColor: const Color(0xFFFFF6EC),
    );
  }
}
