import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/custom_widgets/custom_card.dart';
import '../providers/product_provider.dart';
import '../custom_widgets/product_card.dart';

class CatalogViews extends ConsumerStatefulWidget {
  const CatalogViews({super.key});

  @override
  ConsumerState<CatalogViews> createState() => _CatalogViewState();
}

class _CatalogViewState extends ConsumerState<CatalogViews> {
  String selectedFilter = 'All'; // Estado inicial del filtro que es toda la lista del backend

  @override
  Widget build(BuildContext context) {
    final productsAsyncValue = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty Catalog'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: productsAsyncValue.when(
        data: (products) {
          final filteredProducts = selectedFilter == 'All'
              ? products
              : products
                  .where((product) => product.gender == selectedFilter)
                  .toList();

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: BannerView(
                    imageUrl: 'assets/banner.png',
                    title: "Majority's best choice",
                    subtitle: 'Look free and attractive',
                    buttonText: 'See more',
                    onButtonPressed: () {
                      debugPrint('Button pressed!');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _FilterButton(
                        label: 'All',
                        isSelected: selectedFilter == 'All',
                        onPressed: () {
                          setState(() {
                            selectedFilter = 'All';
                          });
                        },
                      ),
                      _FilterButton(
                        label: 'Male',
                        isSelected: selectedFilter == 'Male',
                        onPressed: () {
                          setState(() {
                            selectedFilter = 'Male';
                          });
                        },
                      ),
                      _FilterButton(
                        label: 'Female',
                        isSelected: selectedFilter == 'Female',
                        onPressed: () {
                          setState(() {
                            selectedFilter = 'Female';
                          });
                        },
                      ),
                      _FilterButton(
                        label: 'Unknown',
                        isSelected: selectedFilter == 'Unknown',
                        onPressed: () {
                          setState(() {
                            selectedFilter = 'Unknown';
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ProductCard(product: filteredProducts[index]),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            Center(child: Text('Error: ${error.toString()}')),
      ),
    );
  }
}



// Widget de filtros
class _FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const _FilterButton({
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.black,
        backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(label),
    );
  }
}
