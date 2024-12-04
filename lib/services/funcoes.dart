import 'package:flutter/material.dart';

void mostrarSnackBar(
    BuildContext context, String mensagem, int duracaoSegundos) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(mensagem),
      duration: Duration(seconds: duracaoSegundos),
    ),
  );
}
