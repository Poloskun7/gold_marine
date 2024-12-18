import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gold_marine/background.dart';
import 'package:gold_marine/providers.dart';
import 'package:gold_marine/screens/catalog_screen/category.dart';

class CategoriesWidget extends StatelessWidget {
  final List<CategoryButtonWidget> categoryWidgets;
  const CategoriesWidget({super.key, required this.categoryWidgets});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categoryWidgets.map((widget) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: widget,
          );
        }).toList(),
      ),
    );
  }
}

class CategoryButtonWidget extends ConsumerWidget {
  final Category category;
  final String? nextScreen;
  const CategoryButtonWidget(
      {super.key, required this.category, this.nextScreen});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategoryId = ref.watch(selectedCategoryIdProvider);
    return GestureDetector(
      onTap: () {
        ref.read(selectedCategoryIdProvider.notifier).state = category.id;
        ref.read(maxPriceProvider.notifier).state = 200000;
        ref.read(maxCapacityProvider.notifier).state = 150;
        nextScreen != null ? context.go(nextScreen!) : null;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          gradient:
              selectedCategoryId == category.id ? AnimatedGradient.gradient : null,
          color: selectedCategoryId == category.id ? null : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: selectedCategoryId == category.id
            ? Text(
                category.name,
                style: const TextStyle(color: Colors.white),
              )
            : ShaderMask(
                shaderCallback: (Rect bounds) {
                  return AnimatedGradient.gradient.createShader(bounds);
                },
                child: Text(
                  category.name,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
      ),
    );
  }
}
