import 'package:flutter/material.dart';

class Text3 extends StatelessWidget {
  const Text3({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: const TextSpan(style: TextStyle(color: Colors.white), children: [
      TextSpan(
          text:
              '• Вы можете отправиться с нами на водную экскурсию по одному из классических петербургских маршрутов:\n'),
      TextSpan(
          text:
              '• Часовой маршрут проходит по малым рекам и каналам, с выходом в Неву\n'),
      TextSpan(
          text:
              '• Двухчасовой маршрут проходит по всем рекам и каналам, с выходом в Неву\n'),
      TextSpan(
          text:
              '• Три часа и более проходит по всем каналам, нева, финский залив\n'),
      TextSpan(
          text:
              '• Ночная прогулка на разводные мосты минимальная 2 часа с 00:00-02:00\n'),
      TextSpan(
          text:
              '• У нас индивидуальный подход, часовой маршрут может быть построен исходя из ваших пожеланий\n'),
    ]));
  }
}
