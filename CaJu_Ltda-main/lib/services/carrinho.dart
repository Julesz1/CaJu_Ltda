import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart'; // Para ChangeNotifier
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

class CarrinhoService extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> _itensCarrinho = [];

  // Getter para itens do carrinho
  List<Map<String, dynamic>> get itens => List.unmodifiable(_itensCarrinho);

  // Método para adicionar item ao carrinho
  void adicionarItem(Map<String, dynamic> item, int quantidade) {
    final novoItem = Map<String, dynamic>.from(item);
    novoItem['quantidade'] = quantidade;
    novoItem['preco_total'] = novoItem['preco'] * quantidade;

    _itensCarrinho.add(novoItem);

    // Notifica listeners (para atualizar widgets que usam esse serviço)
    notifyListeners();
  }

  // Método para remover item do carrinho
  void removerItem(Map<String, dynamic> item) {
    _itensCarrinho.remove(item);

    // Notifica listeners
    notifyListeners();
  }

  // Calcula o total dos itens no carrinho
  double get total {
    return _itensCarrinho.fold(0.0, (soma, item) => soma + item['preco_total']);
  }

  // Quantidade de itens no carrinho
  int get quantidadeItens {
    return _itensCarrinho.length;
  }

  // Método para finalizar o pedido
  Future<void> finalizarPedido() async {
    try {
      // Verifica se o carrinho não está vazio
      if (_itensCarrinho.isEmpty) {
        throw Exception('O carrinho está vazio.');
      }

      // Verifica se o usuário está autenticado
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception('Usuário não autenticado.');
      }

      final uid = user.uid;

      // Cria o pedido principal na coleção "pedidos"
      final pedido = {
        "uid": uid,
        "status": "preparando",
        "data_hora": DateTime.now().toIso8601String(),
        "total": total,
      };

      final docRef = await _firestore.collection('pedidos').add(pedido);

      // Adiciona os itens na subcoleção "itens" do pedido
      for (var item in _itensCarrinho) {
        await _firestore
            .collection('pedidos')
            .doc(docRef.id)
            .collection('itens')
            .add({
          "nome": item['nome'], // Nome do item
          "preco_unitario": item['preco'], // Preço unitário
          "quantidade": item['quantidade'], // Quantidade
          "preco_total": item['preco_total'], // Preço total
        });
      }

      // Limpa o carrinho após finalizar o pedido
      _itensCarrinho.clear();

      // Notifica listeners
      notifyListeners();

      print("Pedido finalizado com sucesso: ${docRef.id}");
    } catch (e) {
      print("Erro ao finalizar pedido: $e");
      rethrow; // Relança o erro para ser tratado onde o método foi chamado
    }
  }
}

// Configuração do GetIt para registrar o serviço
void setupServiceLocator() {
  getIt.registerSingleton<CarrinhoService>(CarrinhoService());
}
