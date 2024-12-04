import 'package:flutter/material.dart';

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  ContadorState createState() => ContadorState();
}


class ContadorState extends State<Contador> {
  int quantidade = 1;

  void incremento() {
    setState(() {
      quantidade++;
    });
  }

  void decremento() {
    if (quantidade > 1) {
      setState(() {
        quantidade--;
      });
    }
  }

  int getQuantidade() {
    return quantidade;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: decremento,
        ),
        Text('$quantidade', style: const TextStyle(fontSize: 20)),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: incremento,
        ),
      ],
    );
  }
}
