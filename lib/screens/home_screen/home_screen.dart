import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gold_marine/providers.dart';
import 'package:gold_marine/background.dart';
import 'package:gold_marine/screens/catalog_screen/category.dart';
import 'package:gold_marine/screens/catalog_screen/widgets/categories_widget.dart';
import 'package:gold_marine/screens/home_screen/widgets/header.dart';
import 'package:gold_marine/screens/home_screen/widgets/logo_widget.dart';
import 'package:gold_marine/screens/home_screen/widgets/text1.dart';
import 'package:gold_marine/screens/home_screen/widgets/text2.dart';
import 'package:gold_marine/screens/home_screen/widgets/text3.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marineData = ref.watch(marineDataProvider);
    return Background(
      child: Scaffold(
        body: marineData.when(
          data: (data) {
            final marines = data.marines.toList();
            return ListView(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 55, bottom: 20),
              children: [
                const LogoWidget(height: 100),
                const SizedBox(height: 20),
                const Header(),
                const SizedBox(height: 20),
                const Text1(),
                const SizedBox(height: 10),
                CategoriesWidget(
                  categoryWidgets: _buildCategoryWidgets(data.categories),
                ),
                const SizedBox(height: 10),
                const Text2(),
                const SizedBox(height: 10),
                const Text3(),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) =>
              const Center(child: Text('Ошибка загрузки данных')),
        ),
      ),
    );
  }

  List<CategoryButtonWidget> _buildCategoryWidgets(Set<Category> categories) {
    return categories
        .map((category) => CategoryButtonWidget(
              category: category,
              nextScreen: '/catalog',
            ))
        .toList();
  }
}
