import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/views/cart_view.dart';
import 'package:rick_and_morty/views/catalog_view.dart';


void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => CatalogViews(),
        '/cart': (context) => CartView(),
      },
    );
  }
}
