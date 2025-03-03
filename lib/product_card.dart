import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required Color backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

        // container has margin and padding property to align the content.
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(16),

        // To make rounded border. use decoration property. since we don't have border in container().
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(213, 216, 216, 1),
        ),

        // we want 3 things 1. title 2. price 3. image

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            // Price
            const SizedBox(height: 5),
            Text(
              '\$$price',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            // Image -> use image.asset to display the image.
            // wrapped with center to make the image in center.
            const SizedBox(height: 5),
            Center(child: Image.asset(image, height: 175)),
          ],
        ));
  }
}
