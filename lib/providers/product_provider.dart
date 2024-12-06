import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';

final productsProvider = Provider<List<Product>>((ref) {
  return [
    Product(
      id: '1',
      name: 'Mittens Stylish Jacket',
      imageUrl: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
      price: 149.99,
    ),
    Product(
      id: '2',
      name: 'Fleece Long Jacket',
      imageUrl: 'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
      price: 178.99,
    ),
  ];
});
