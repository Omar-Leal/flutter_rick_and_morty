import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/custom_widgets/cart_selections.dart';
import 'package:rick_and_morty/custom_widgets/gradiente_button.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class DetailsView extends ConsumerWidget {
  final Product product;

  DetailsView({required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Column(
        children: [
          Container(
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('\$${product.price.toStringAsFixed(2)}'),
                const SizedBox(height: 40),
                Center(
                  child: ProductSelectionCard(
                    title: 'Select sweater color',
                    colors: const [
                      Color(0xFFD3CCE3),
                      Color(0xFFE9E4F0),
                      Color(0xFFD3CCE3)
                    ],
                    sizes: const ['XS', 'S', 'M', 'L', 'XL'],
                    selectedSize: 'M',
                    onSizeSelected: (size) => print('Selected size: $size'),
                    onColorSelected: (color) => print('Selected color: $color'),
                    discount: 30.0,
                  ),
                ),
               
                Center(
                  child: GradientButton(
                    text: 'Add to Cart',
                    onPressed: () {
                      ref.read(cartProvider.notifier).addProduct(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to cart!')));
                    },
                    width: 250, 
                    height: 60, 
                  ),
                ),
        

              ],
            ),
          ),
        ],
      ),
    );
  }
}
