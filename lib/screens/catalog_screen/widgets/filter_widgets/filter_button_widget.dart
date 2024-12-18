import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gold_marine/providers.dart';
import 'package:gold_marine/background.dart';
import 'package:gold_marine/screens/catalog_screen/widgets/filter_widgets/slider_widget.dart';

class FilterButtonWidget extends ConsumerWidget {
  const FilterButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterAdressesButton = ref.watch(filterAdressesButtonProvider);
    return GestureDetector(
      onTap: () {
        showDraggableBottomSheet(context, filterAdressesButton);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: const BoxDecoration(
          gradient: AnimatedGradient.gradient,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: const Row(
          children: [
            Icon(
              Icons.filter_alt_outlined,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              'Фильтр',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showDraggableBottomSheet(
      BuildContext context, bool filterAdressesButton) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Позволяет BottomSheet занимать всю высоту
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize:
              0.5, // Начальный размер BottomSheet (50% высоты экрана)
          minChildSize:
              0.2, // Минимальный размер BottomSheet (20% высоты экрана)
          maxChildSize:
              0.9, // Максимальный размер BottomSheet (90% высоты экрана)
          expand: false, // Запрещает расширение до полной высоты
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                gradient: AnimatedGradient.gradient,
              ),
              child: Container(
                margin: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  controller: scrollController,
                  children: [
                    const SizedBox(height: 20),
                    SliderWidget(
                      text: 'Максимальная стоимость',
                      step: 5000.0,
                      minRange: 0.0,
                      maxRange: 200000.0,
                      provider: maxPriceProvider,
                    ),
                    SliderWidget(
                      text: 'Максимальная вместимость',
                      step: 1.0,
                      minRange: 0.0,
                      maxRange: 150.0,
                      provider: maxCapacityProvider,
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
