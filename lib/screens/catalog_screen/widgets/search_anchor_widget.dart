import 'package:flutter/material.dart';
import 'package:gold_marine/background.dart';

class Product {
  final String name;

  Product({required this.name});
}

class SearchAnchorWidget extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'ggg'),
    Product(name: 'bbb'),
    Product(name: 'gggcc')
  ];

  SearchAnchorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            gradient: AnimatedGradient.gradient,
            borderRadius: BorderRadius.circular(15),
          ),
          child: SearchBar(
            hintText: 'Искать',
            hintStyle: WidgetStatePropertyAll<TextStyle>(
              TextStyle(
                color: Colors.grey[600],
                fontSize: 14.0,
              ),
            ),
            controller: controller,
            padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            ),
            onTap: () {
              controller.openView();
            },
            onChanged: (value) {
              controller.openView();
            },
            backgroundColor: const WidgetStatePropertyAll<Color>(
              Colors.white,
            ),
            shape: WidgetStatePropertyAll<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        final String input = controller.value.text;
        final List<Product> filteredProducts = products
            .where((Product item) =>
                item.name.toLowerCase().contains(input.toLowerCase()))
            .toList();

        return filteredProducts.map((Product filteredItem) {
          return ListTile(
            title: Text(filteredItem.name),
            onTap: () {
              controller.closeView(filteredItem.name);
            },
          );
        }).toList();
      },
    );
  }
}