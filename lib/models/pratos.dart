class Pratos {

  final String nome;
  final String descricao;
  final String imagem;
  final PratosCategoria categoria;
  double preco;
  int quantidade;

  Pratos({
    required this.nome,
    required this.descricao,
    required this.imagem,
    required this.categoria,
    required this.preco,
    required this.quantidade
  });
}

enum PratosCategoria {
  bebidasQuentes,
  bebidasFrias,
  salgados,
  doces
}
