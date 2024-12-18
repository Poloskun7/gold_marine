import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final sliderValueProvider = StateProvider<double>((ref) => 200000);

class SliderWidget extends ConsumerWidget {
  final String text;
  final double step;
  final double minRange;
  final double maxRange;
  final StateProvider<int> provider;
  const SliderWidget(
      {super.key,
      required this.text,
      required this.step,
      required this.minRange,
      required this.maxRange,
      required this.provider});

  double _roundToStep(double value, double step) {
    return (step * (value / step).round()).toDouble();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Получаем текущее значение из провайдера
    final int sliderValue = ref.watch(provider);

    return Column(
      children: [
        Text('$text $sliderValue'), // Отображаем текст и значение
        Slider(
          activeColor: Colors.orange,
          inactiveColor: Colors.blueAccent,
          value: sliderValue.toDouble(), // Используем значение из провайдера
          min: minRange,
          max: maxRange,
          onChanged: (double value) {
            // Обновляем значение в провайдере
            ref.read(provider.notifier).state = _roundToStep(value, step).toInt();
          },
          label: sliderValue.toString(), // Метка для текущего значения
        ),
      ],
    );
  }
}
