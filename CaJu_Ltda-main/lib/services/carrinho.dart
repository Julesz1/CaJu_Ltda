import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class CarrinhoService {
  List<Map<String, dynamic>> _itensCarrinho = [];

  List<Map<String, dynamic>> get itens => _itensCarrinho;

  void adicionarItem(Map<String, dynamic> item, int quantidade) {
    item['quantidade'] = quantidade;
    item['preco'] = item['preco'] * quantidade;
    _itensCarrinho.add(item);

  }

  void removerItem(Map<String, dynamic> item) {
    _itensCarrinho.remove(item);
  }

  double get total {
    return _itensCarrinho.fold(0.0, (soma, item) => soma + item['preco']);
  }

  int get quantidadeItens {
    return _itensCarrinho.length;
  }
}

void setupServiceLocator() {
  getIt.registerSingleton<CarrinhoService>(CarrinhoService());
}