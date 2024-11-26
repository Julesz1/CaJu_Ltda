import 'package:flutter/material.dart';
import 'package:projeto07/models/pratos.dart';

class CarrinhoProvider with ChangeNotifier {
  final List<Pratos> _carrinho = [];

  List<Pratos> get carrinho => _carrinho;

  void adicionarItem(Pratos item){
    _carrinho.add(item);
    notifyListeners();
  }

  void removerItem(Pratos item){
    _carrinho.remove(item);
    notifyListeners();
  }

  double get total {
    return _carrinho.fold(0, (total, item) => total + item.preco);
  }
}
