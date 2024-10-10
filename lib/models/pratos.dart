class Pratos {

  final String nome;
  final String descricao;
  final String imagem;
  final PratosCategoria categoria;
  final double preco;

  Pratos({
    required this.nome,
    required this.descricao,
    required this.imagem,
    required this.categoria,
    required this.preco
  });
}

enum PratosCategoria {
  bebidasQuentes,
  bebidasFrias,
  salgados,
  doces
}
