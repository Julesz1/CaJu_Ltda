// ignore_for_file: unnecessary_cast

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getCategorias() async {
    QuerySnapshot querySnapshot = await _firestore.collection('categorias').get();
    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  Future<List<Map<String, dynamic>>> getItensCardapio(String categoria) async {
    final querySnapshot = await FirebaseFirestore.instance
      .collection('itens_cardapio')
      .where('categoria', isEqualTo: categoria)
      .where('ativo', isEqualTo: true)
      .get();
    
    return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }
}