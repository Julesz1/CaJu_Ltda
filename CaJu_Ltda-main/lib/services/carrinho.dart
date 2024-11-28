// ignore_for_file: avoid_print

import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final getIt = GetIt.instance;

class PedidoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> finalizarPedido(List<Map<String, dynamic>> itensCarrinho) async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('Usuário não autenticado');
      }

      final uid = user.uid;

      // Criação do documento do pedido
      final pedido = {
        "uid": uid,
        "status": "preparando",
        "data_hora": DateTime.now().toIso8601String(),
      };

      final docRef = await _firestore.collection('pedidos').add(pedido);

      // Adicionando os itens do pedido
      for (var item in itensCarrinho) {
        await _firestore
            .collection('pedidos')
            .doc(docRef.id)
            .collection('itens')
            .add({
          "nome": item['nome'],
          "preco": item['preco'], // Corrigido o nome da chave
          "quantidade": item['quantidade'],
        });
      }
    } catch (e) {
      print("Erro ao finalizar pedido: $e");
      rethrow; // Propaga o erro para que possa ser tratado em outro local
    }
  }
}

class CarrinhoService {
  List<Map<String, dynamic>> _itensCarrinho = [];

  List<Map<String, dynamic>> get itens => List.unmodifiable(_itensCarrinho);

  void adicionarItem(Map<String, dynamic> item, int quantidade) {
    final novoItem = Map<String, dynamic>.from(item);
    novoItem['quantidade'] = quantidade;
    novoItem['preco_total'] = novoItem['preco'] * quantidade;

    _itensCarrinho.add(novoItem);
  }

  void removerItem(Map<String, dynamic> item) {
    _itensCarrinho.remove(item);
  }

  double get total {
    return _itensCarrinho.fold(0.0, (soma, item) => soma + item['preco_total']);
  }

  int get quantidadeItens {
    return _itensCarrinho.length;
  }
}


void setupServiceLocator() {
  getIt.registerSingleton<CarrinhoService>(CarrinhoService());
}