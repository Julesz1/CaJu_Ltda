import 'package:flutter/material.dart';

class CarrinhoProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _carrinho = [];

  List<Map<String, dynamic>> get carrinho => _carrinho;

  void adicionarItem(Map<String, dynamic> item){
    _carrinho.add(item);
    notifyListeners();
  }

  void removerItem(Map<String, dynamic> item){
    _carrinho.remove(item);
    notifyListeners();
  }

  double get total {
    return _carrinho.fold(0, (total, item) => total + item['preco']);
  }
}
