// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Cardapio extends StatefulWidget {
  const Cardapio({super.key});

  @override
  State<Cardapio> createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( 
        child: Text(
          'Cardápio',
          style: TextStyle(fontSize: 24), 
        ),
      ),
    );
  }
}
