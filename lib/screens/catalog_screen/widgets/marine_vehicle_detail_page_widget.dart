import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gold_marine/background.dart';
import 'package:gold_marine/screens/catalog_screen/marine_vehicle.dart';
import 'package:gold_marine/screens/catalog_screen/widgets/booking_button_widget.dart';

class MarineVehicleDetailPageWidget extends ConsumerWidget {
  final MarineVehicle marineVehicle;
  const MarineVehicleDetailPageWidget({super.key, required this.marineVehicle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                clipBehavior: Clip.hardEdge,
                child: marineVehicle.images.isNotEmpty
                    ? Image.network(marineVehicle.images.first,
                        fit: BoxFit.cover)
                    : const Text('Нет фото'),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  gradient: AnimatedGradient.gradient,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Text(marineVehicle.name,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 20),
                      Text('Стоимость: от ${marineVehicle.price}/час'),
                      const SizedBox(height: 10),
                      Text('Вместимость: ${marineVehicle.capacity} гостей'),
                      const SizedBox(height: 10),
                      Text('Длина катера: ${marineVehicle.length} метров'),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              '${marineVehicle.nameMarina}: ${marineVehicle.addressMarina}'),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: const BoxDecoration(
                                gradient: AnimatedGradient.gradient,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.map, color: Colors.white,),
                                  SizedBox(width: 10),
                                  Text('Карта', style: TextStyle(color: Colors.white),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(marineVehicle.description),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const BookingButtonWidget(),
            ],
          ),
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Align(
                  alignment: Alignment(-1, -0.75),
                  child: Icon(Icons.arrow_back, color: Colors.white,)),
            ),
          )
        ],
      ),
    );
  }
}
