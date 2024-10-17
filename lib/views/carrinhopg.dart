import 'package:flutter/material.dart';
import 'package:projeto07/models/pratos.dart';
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
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: R\$ ${carrinhoService.total.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFFFF6EC), 
    );
  }
}
