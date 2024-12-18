import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gold_marine/background.dart';
import 'package:gold_marine/providers.dart';
import 'package:gold_marine/screens/catalog_screen/category.dart';
import 'package:gold_marine/screens/catalog_screen/widgets/categories_widget.dart';
import 'package:gold_marine/screens/catalog_screen/widgets/filter_widgets/filter_button_widget.dart';
import 'package:gold_marine/screens/catalog_screen/widgets/marine_vehicle_card_widget.dart';
import 'package:gold_marine/screens/catalog_screen/widgets/search_anchor_widget.dart';
import 'package:gold_marine/screens/home_screen/widgets/logo_widget.dart';

class CatalogScreen extends ConsumerWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final marineData = ref.watch(marineDataProvider);
    final selectedCategoryId = ref.watch(selectedCategoryIdProvider);
    final maxPrice = ref.watch(maxPriceProvider);
    final maxCapacity = ref.watch(maxCapacityProvider);
    final isSearch = ref.watch(isSearchProvider);
    return Background(
      child: Scaffold(
        appBar: AppBar(
          title: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LogoWidget(height: 55),
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return AnimatedGradient.gradient.createShader(bounds);
                    },
                    child: IconButton(
                        onPressed: () {
                          ref.read(isSearchProvider.notifier).state = !isSearch;
                        },
                        icon: const Icon(Icons.search, color: Colors.white)),
                  ),
                ],
              ),
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return AnimatedGradient.gradient.createShader(bounds);
                },
                child: const Text(
                  'Каталог',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.blue[900],
        ),
        body: marineData.when(
          data: (data) {
            final filteredMarineVehicles = data.marineVehicles
                .where((marineVehicle) =>
                    marineVehicle.typeId == selectedCategoryId &&
                    marineVehicle.price! <= maxPrice &&
                    marineVehicle.capacity <= maxCapacity)
                .toList();
            final categories = data.categories.toList();
            return Scrollbar(
              thickness: 6,
              radius: const Radius.circular(20),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  children: [
                    if (isSearch)
                      Column(
                        children: [
                          SearchAnchorWidget(),
                          const SizedBox(height: 20),
                        ],
                      ),
                    Row(
                      children: [
                        const FilterButtonWidget(),
                        Expanded(
                          child: CategoriesWidget(
                            categoryWidgets:
                                _buildCategoryWidgets(data.categories),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      categories[selectedCategoryId - 1].name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: GridView.builder(
                        // padding: const EdgeInsets.only(
                        //     left: 16, right: 16, bottom: 20),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Количество столбцов
                          mainAxisSpacing: 5.0, // Расстояние между строками
                          crossAxisSpacing: 5.0, // Расстояние между столбцами
                          childAspectRatio:
                              0.45, // Соотношение сторон для карточек
                        ),
                        itemCount: filteredMarineVehicles.length,
                        itemBuilder: (context, index) {
                          return MarineVehicleCardWidget(
                              marineVehicle: filteredMarineVehicles[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
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
        .map((category) => CategoryButtonWidget(category: category))
        .toList();
  }
}
