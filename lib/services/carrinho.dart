import 'package:get_it/get_it.dart';
import 'package:projeto07/models/pratos.dart';
import 'package:projeto07/models/cafeteria.dart';

final getIt = GetIt.instance;

class CarrinhoService {
  List<Pratos> _itensCarrinho = [];

  List<Pratos> get itens => _itensCarrinho;

  void adicionarItem(Pratos item, int qualidade) {
    _itensCarrinho.add(item);

  }

  void removerItem(Pratos item) {
    _itensCarrinho.remove(item);
  }

  double get total {
    return _itensCarrinho.fold(0.0, (soma, item) => soma + item.preco);
  }

  int get quantidadeItens {
    return _itensCarrinho.length;
  }
}

void setupServiceLocator() {
  getIt.registerSingleton<CarrinhoService>(CarrinhoService());
}