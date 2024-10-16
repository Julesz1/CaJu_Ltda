// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:projeto07/main.dart';
import 'package:projeto07/providers/carrinho_provider.dart';
import 'package:provider/provider.dart';

class Carrinhopg extends StatelessWidget {
  const Carrinhopg({super.key});

  @override
  Widget build(BuildContext context) {
    final carrinhoProvider = Provider.of<CarrinhoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: bege,
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 80),
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
                    itemCount: carrinhoProvider.carrinho.length,
                    itemBuilder: (context, index) {
                      final item = carrinhoProvider.carrinho[index];
                      return ListTile(
                        title: Text(item.nome),
                        subtitle: Text('Quantidade: 1'),
                        trailing: Text('R\$ ${item.preco.toStringAsFixed(2)}'),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Total: R\$ ${carrinhoProvider.total.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
      backgroundColor: fundoTela,
    );
  }
}
