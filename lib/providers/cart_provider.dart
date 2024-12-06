import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<Product>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<Product>> {
  CartNotifier() : super([]);

  void addProduct(Product product) {
    state = [...state, product];
  }

  void removeProduct(Product product) {
    state = state.where((p) => p.id != product.id).toList();
  }

  double get totalPrice {
    return state.fold(0, (sum, product) => sum + product.price);
  }
}
