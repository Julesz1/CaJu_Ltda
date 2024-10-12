import 'package:flutter/material.dart';
import 'package:projeto07/models/pratos.dart';

//definindo a paleta
const Color vermelhoQueimado = Color(0xFF8A2F38);
const Color verde = Color(0xFF6E744D);
const Color bege = Color(0xFFC48C64);
const Color laranja = Color(0xFFB44134);
const Color fundoTela = Color(0xFFFFF6EC);

class Detalhes extends StatefulWidget {
  const Detalhes({super.key});

  @override
  State<Detalhes> createState() => _DetalhesState();
}

class _DetalhesState extends State<Detalhes> {
  @override
  Widget build(BuildContext context) {
    Pratos dados = ModalRoute.of(context)!.settings.arguments as Pratos;

    return Scaffold(
      backgroundColor: fundoTela,
      appBar: AppBar(
        backgroundColor: bege,
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    width: double.infinity,
                    child: Image.asset(
                      dados.imagem,
                      fit: BoxFit.cover,
                      height: 300,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      dados.nome,
                      style: TextStyle(
                        fontSize: 24,
                        color: vermelhoQueimado,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Descrição',
                      style: TextStyle(fontSize: 12),
                    ),
                    subtitle: Text(
                      dados.descricao,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Preço:',
                      style: TextStyle(fontSize: 12),
                    ),
                    subtitle: Text(
                      dados.preco.toString() +
                          ',00', // eu vou arrumar essa gambiarra porteriormente ;-;
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Botão pressionado');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 203, 117, 47),
                      foregroundColor: fundoTela,
                      minimumSize: Size(double.infinity, 60),
                    ),
                    child: Text(
                      'Adicionar ao carrinho',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
