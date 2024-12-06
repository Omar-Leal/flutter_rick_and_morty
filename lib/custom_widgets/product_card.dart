import 'package:flutter/material.dart';
import '../models/product.dart';
import '../views/details_view.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsView(product: product),
          ),
        );
      },
      child: Container(
         margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFFD3CCE3), Color(0xFFE9E4F0), Color(0xFFD3CCE3)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
        child: Column(
          children: [
            Expanded(
              child: Image.network(product.imageUrl, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Text('\$${product.price.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
