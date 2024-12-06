import 'package:flutter/material.dart';

class ProductSelectionCard extends StatelessWidget {
  final String title;
  final List<Color> colors;
  final List<String> sizes;
  final String selectedSize;
  final Function(String) onSizeSelected;
  final Function(Color) onColorSelected;
  final double discount;

  const ProductSelectionCard({
    super.key,
    required this.title,
    required this.colors,
    required this.sizes,
    required this.selectedSize,
    required this.onSizeSelected,
    required this.onColorSelected,
    this.discount = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        // Color selection
        Row(
          children: colors
              .map((color) => GestureDetector(
                    onTap: () => onColorSelected(color),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        
                      ),
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 16),

        // Size selection
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: sizes.map((size) {
            bool isSelected = size == selectedSize;
            return GestureDetector(
              onTap: () => onSizeSelected(size),
              child: Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.black : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: isSelected
                      ? null
                      : Border.all(color: Colors.grey.shade300),
                ),
                child: Text(
                  size,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),

        // Discount text
        if (discount > 0.0)
          Text(
            '${discount.toStringAsFixed(0)}% off',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
      ],
    );
  }
}
