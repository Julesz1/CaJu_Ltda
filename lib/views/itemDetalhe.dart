// ignore_for_file: file_names, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:projeto07/main.dart';
import 'package:projeto07/models/pratos.dart';
import 'package:projeto07/providers/carrinho_provider.dart';
import 'package:provider/provider.dart';

class Itemdetalhe extends StatefulWidget {
  final Pratos item;
  const Itemdetalhe({super.key, required this.item});

  @override
  State<Itemdetalhe> createState() => _ItemdetalheState();
}

class _ItemdetalheState extends State<Itemdetalhe> {
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
        
            Image.asset(widget.item.imagem, width: double.infinity),
        
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                children: [
        
                  Text(
                    widget.item.nome,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
        
                  Text(
                    'R\$' + widget.item.preco.toString(),
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
        
                  SizedBox(height: 10),
        
                  Divider(
                    color: vermelhoQueimado,
        
                  ),
        
                  Text(
                    widget.item.descricao,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                ]
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, top: 10),
              child: FloatingActionButton(
                onPressed: () {
                  Provider.of<CarrinhoProvider>(context, listen: false).adicionarItem(widget.item);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Produto adicionado ao carrinho!'),)
                  );
                },
                child: const Icon(Icons.add_shopping_cart),
              )      
            ),
          ],
        ),
      ),
      backgroundColor: fundoTela,
    );
  }
}