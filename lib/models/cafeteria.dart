import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:projeto07/models/pratos.dart';

class Cafeteria with ChangeNotifier {
  
  final List<Pratos> _items = [
    Pratos(
      nome: 'Affogato',
      descricao: 'Uma deliciosa combinação de café espresso quente derramado sobre uma bola de sorvete artesanal de baunilha, trazendo um equilíbrio entre o sabor forte do café e a cremosidade doce do sorvete.',
      imagem: '../assets/images/bebidasquentes/affogato.jpg',
      categoria: PratosCategoria.bebidasQuentes,
      preco: 15.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Americano',
      descricao: 'Um café suave, preparado com uma dose de espresso misturada com água quente, criando uma bebida mais leve e equilibrada. Perfeito para quem prefere um café mais longo e menos intenso.',
      imagem: '../assets/images/bebidasquentes/americano.jpg',
      categoria: PratosCategoria.bebidasQuentes,
      preco: 8.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Cappuccino',
      descricao: 'Uma deliciosa mistura de espresso forte, leite vaporizado e espuma de leite cremoso, finalizado com uma leve camada de cacau em pó. Uma bebida equilibrada e reconfortante, ideal para proporcionar uma pausa saborosa a qualquer hora.',
      imagem: '../assets/images/bebidasquentes/capuccino.jpg',
      categoria: PratosCategoria.bebidasQuentes,
      preco: 14.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Chai',
      descricao: 'Uma infusão aromática de chá preto com uma mistura especial de especiarias, como canela, cardamomo, gengibre e cravo, combinada com leite cremoso e um toque de açúcar. Oferede um sabor exótico e reconfortante, perfeito para aquecer o corpo e a alma.',
      imagem: '../assets/images/bebidasquentes/chai.jpg',
      categoria: PratosCategoria.bebidasQuentes,
      preco: 11.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Chocolate Quente',
      descricao: 'Uma bebida cremosa feita com chocolate de alta qualidade, combinada com leite quente e um toque de açúcar. Servido quente e com cobertura de marshmallows, nosso chocolate qunete é a escolha perfeita para aquecer seu coração.',
      imagem: '../assets/images/bebidasquentes/chocolatequente.jpg',
      categoria: PratosCategoria.bebidasQuentes,
      preco: 14.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Espresso',
      descricao: 'Um clássico atemporal, o café espresso é uma dose concentrada de sabor e aroma. Preparado com grãos de café finamente moídos, este café encorpado é extraído sob alta pressão, resultando em uma bebida intensa. Ideal para quem aprecia um café forte e autêntico. ',
      imagem: '../assets/images/bebidasquentes/espresso.jpg',
      categoria: PratosCategoria.bebidasQuentes,
      preco: 10.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Latte',
      descricao: 'Uma combinação suave de uma dose de espresso e leite vaporizao, criando uma bebida cremosa e reconfortante. Finalizado com uma camada de espuma de leite, o café latte é perfeito pra quem aprecia o equilíbrio entre o sabor forte do café e a suavidade do leite.',
      imagem: '../assets/images/bebidasquentes/latte.jpg',
      categoria: PratosCategoria.bebidasQuentes,
      preco: 12.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Chá de Pêssego',
      descricao: 'Servido gelado e adoçao, infundido com fatias de pêssego, esse chá é a bebida perfeita para os dias quentes. De sabor doce e frutado, proporciona sensação refrescante e saborosa.',
      imagem: '../assets/images/bebidasfrias/chapessego.jpg',
      categoria: PratosCategoria.bebidasFrias,
      preco: 12.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Cold Brew',
      descricao: 'Uma experiência refrescante de café, feita com grãos de café coados a frio por várias horas, resultando em uma bebida suave e menos ácida. Servido gelado, o cold brew destaca os sabores sutis dos grãos, proporcionando uma explosão de frescor a cada gole.',
      imagem: '../assets/images/bebidasfrias/coldbrew.jpg',
      categoria: PratosCategoria.bebidasFrias,
      preco: 13.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Café Geladim',
      descricao: 'Uma deliciosa combinação de café fresco e gelo, ideal para os dias quentes. Preparado com café forte e adoçado a gosto, o iced coffee é servido gelado, tornando-se refrescante e energizante.',
      imagem: '../assets/images/bebidasfrias/geladim.jpg',
      categoria: PratosCategoria.bebidasFrias,
      preco: 10.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Frappuccino',
      descricao: 'Bebida gelada, feita com café espresso, leite e gelo, batidos até obter uma consistência cremosa e suave. Finalizado com chantilly e um toque de calda de chocolate.',
      imagem: '../assets/images/bebidasfrias/frapuccino.jpg',
      categoria: PratosCategoria.bebidasFrias,
      preco: 16.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Limonada',
      descricao: 'Uma refrescante mistura de limões frescos espremidos, água e açúcar, servida com gelo. Esta bebida clássica é perfeita para os dias quentes, oferecendo um equilíbrio ideal entre o azedo e o doce.',
      imagem: '../assets/images/bebidasfrias/limonada.jpg',
      categoria: PratosCategoria.bebidasFrias,
      preco: 12.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Smoothie de Frutas Vermelhas',
      descricao: 'Uma mistura cremosa e nutritiva de morangos, framboesas e mirtilos, batidos com iogurte e um toque de mel. Este smoothie refrescante é rico em antioxidantes e sabores vibrantes, perfeito para começar o dia ou como um lanche saudável.',
      imagem: '../assets/images/bebidasfrias/smoothie.jpg',
      categoria: PratosCategoria.bebidasFrias,
      preco: 14.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Bolo de Banana (fatia)',
      descricao: 'Um delicioso bolo de banana macio, preparado com bananas maduras e coberto com uma camada irresistível de bananas caramelizadas. Esta receita clássica garante que cada fatia seja repleta de sabor e um toque doce. Perfeito para acompanhar seu café.',
      imagem: '../assets/images/doces/bolobanana.jpeg',
      categoria: PratosCategoria.doces,
      preco: 14.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Bolo de Cenoura (fatia)',
      descricao: 'Um bolo fofinho, feito com cenouras frescas que proporcionam um sabor adocicado e uma textura leve. Coberto com uma rica e cremosa ganache de chocolate, ideal para acompanhar um café ou chá.',
      imagem: '../assets/images/doces/bolocenoura.jpeg',
      categoria: PratosCategoria.doces,
      preco: 14.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Brownie',
      descricao: 'Um irresistível brownie de chocolate, com uma textura densa, elaborado com chocolate de alta qualidade. Repleto de pedaços de chocolate derretido, cada garfada oferece uma explosão de sabor e textura. ',
      imagem: '../assets/images/doces/brownie.jpeg',
      categoria: PratosCategoria.doces,
      preco: 15.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Enroladinho de Canela',
      descricao: 'Doce em formato de rocambole, feito com uma massa doce e fofa, enrolada com uma generosa camada de açúcar mascavo e canela, finalizado com uma cobertura de glacê de açúcar e leite. Cada pedaço é assado até ficar dourado, perfeito para acompanhar seu café. ',
      imagem: '../assets/images/doces/cinnamoroll.jpeg',
      categoria: PratosCategoria.doces,
      preco: 14.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Cookie de Baunilha com Gotas de Chocolate',
      descricao: 'Um cookie caseiro macio e delicioso, com um sabor suave de baunilha e repleto de gotas de chocolate derretido.',
      imagem: '../assets/images/doces/cookie.jpeg',
      categoria: PratosCategoria.doces,
      preco: 10.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Panqueca Doce com Maçã',
      descricao: 'Uma deliciosa panqueca americana macia e dourada, recheada com maçãs caramelizadas e um toque de canela. Servida quente e finalizada com uma generosa camada de mel, esta sobremesa é perfeita para quem busca um sabor doce e reconfortante.',
      imagem: '../assets/images/doces/panquecamaca.jpeg',
      categoria: PratosCategoria.doces,
      preco: 15.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Waffle com Frutas Vermelhas',
      descricao: 'Um waffle crocante por fora e macio por dentro, servido quentinho e coberto com uma generosa porção de frutas vermelhas frescas, como morangos, framboesas e mirtilos. Finalizado com uma calda de mel, esta sobremesa é a combinação perfeita de sabores e texturas.',
      imagem: '../assets/images/doces/wafflefrutas.jpeg',
      categoria: PratosCategoria.doces,
      preco: 15.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Croissant de Peito de Peru',
      descricao: 'Um croissant folhado e amanteigado, recheado com fatias finas de peito de peru defumado e complementado com queijo derretido. Servido quentinho, este croissant é uma escolha deliciosa que traz um toque sofisticado à sua pausa para o café.',
      imagem: '../assets/images/salgados/croissant.jpeg',
      categoria: PratosCategoria.salgados,
      preco: 14.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Croque Monsieur de Presunto de Parma',
      descricao: 'Um clássico francês, este sanduíche é preparado com fatias de pão artesanal recheadas com presunto de Parma, queijo e um toque de molho béchamel. Assado até ficar dourado e crocante, o croque monsieur oferece uma combinação irresistível de sabores ricos e texturas cremosas. Perfeito para um almoço leve ou um lanche sofisticado.',
      imagem: '../assets/images/salgados/croquemonsieur.jpeg',
      categoria: PratosCategoria.salgados,
      preco: 16.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Misto Quente',
      descricao: 'Um lanche feito com fatias de pão macio recheadas com queijo derretido e presunto. Grelhado até ficar dourado e crocante, é ideal para um lanche rápido ou um acompanhamento perfeito para o seu café. Simples, saboroso e sempre reconfortante!',
      imagem: '../assets/images/salgados/mistoquente.jpeg',
      categoria: PratosCategoria.salgados,
      preco: 12.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Ovos Mexidos',
      descricao: 'Ovos frescos batidos e cozidos até ficarem cremosos e macios, temperados com sal e pimenta. Servidos quentes e fofinhos, são uma opção perfeita para um café da manhã nutritivo ou um lanche leve. Acompanhados por torradas.',
      imagem: '../assets/images/salgados/ovosmexidos.jpeg',
      categoria: PratosCategoria.salgados,
      preco: 14.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Pão de Queijo',
      descricao: 'Deliciosos e quentinhos, nossos pães de queijo são feitos com polvilho e queijo minas, resultando em um lanche leve e fofinho, com uma crocância irresistível por fora e um interior macio e saboroso. Perfeitos para qualquer hora do dia, são a companhia ideal para acompanhar o seu café ou chá.',
      imagem: '../assets/images/salgados/paodequeijo.jpeg',
      categoria: PratosCategoria.salgados,
      preco: 5.00,
      quantidade: 0
    ),
    Pratos(
      nome: 'Pão na Chapa com Manteiga',
      descricao: 'Fresquinhos e crocantes, nossos pães franceses são grelhados na chapa até ficarem dourados, com uma generosa camada de manteiga derretida que realça seu sabor. Opção PERFEITA para acompanhar seu cafézim!',
      imagem: '../assets/images/salgados/paomanteiga.jpeg',
      categoria: PratosCategoria.salgados,
      preco: 6.00,
      quantidade: 0
    ),
  ];


  List<Pratos> get bebidasQuentes {
    return _items.where((prato) => prato.categoria == PratosCategoria.bebidasQuentes).toList();
  }

  List<Pratos> get bebidasFrias {
    return _items.where((prato) => prato.categoria == PratosCategoria.bebidasFrias).toList();
  }

  List<Pratos> get salgados {
    return _items.where((prato) => prato.categoria == PratosCategoria.salgados).toList();
  }

  List<Pratos> get doces {
    return _items.where((prato) => prato.categoria == PratosCategoria.doces).toList();
  }

  List<Pratos> get items => _items;
}
