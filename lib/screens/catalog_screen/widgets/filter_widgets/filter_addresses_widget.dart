import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gold_marine/background.dart';
import 'package:gold_marine/providers.dart';

class FilterAddressesButtonWidget extends ConsumerWidget {
  const FilterAddressesButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterAdressesButton = ref.watch(filterAdressesButtonProvider);
    return GestureDetector(
      onTap: () {
         ref.read(filterAdressesButtonProvider.notifier).state = !filterAdressesButton;
         print('yes');
         print(filterAdressesButton);
      },
      child: Container(
         padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: const BoxDecoration(
          gradient: AnimatedGradient.gradient,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: const Text('Адреса'),
      ),
    );
  }
}

class FilterAddressesWidget extends StatelessWidget {
  const FilterAddressesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CheckBoxWidget(address: 'aaaaa'),
        CheckBoxWidget(address:'bbbbb'),
        CheckBoxWidget(address:'ccccc'),
      ],
    );
  }
}

class CheckBoxWidget extends StatefulWidget {
  final String address;
  const CheckBoxWidget({super.key, required this.address});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        const SizedBox(width: 10),
        Text(widget.address),
      ],
    );
  }
}
