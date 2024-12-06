import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/models/product.dart';

final productsProvider = FutureProvider<List<Product>>((ref) async {
  final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final results = data['results'] as List;

    return results.map((character) {
      return Product(
        id: character['id'].toString(),
        name: character['name'],
        imageUrl: character['image'],
        price: (character['id'] * 10).toDouble(), 
      );
    }).toList();
  } else {
    throw Exception('Error al obtener los personajes');
  }
});
