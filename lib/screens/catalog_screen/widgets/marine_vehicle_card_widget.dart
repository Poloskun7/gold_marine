import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:gold_marine/background.dart';
import 'package:gold_marine/screens/catalog_screen/marine_vehicle.dart';
import 'package:gold_marine/screens/catalog_screen/widgets/booking_button_widget.dart';
import 'package:gold_marine/screens/catalog_screen/widgets/marine_vehicle_detail_page_widget.dart';

class MarineVehicleCardWidget extends StatelessWidget {
  final MarineVehicle marineVehicle;
  const MarineVehicleCardWidget({super.key, required this.marineVehicle});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      OpenContainer(
        transitionType: ContainerTransitionType.fadeThrough,
        openBuilder: (BuildContext context, VoidCallback _) {
          return MarineVehicleDetailPageWidget(marineVehicle: marineVehicle);
        },
        closedElevation: 10,
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        closedColor: Colors.transparent,
        closedBuilder: (BuildContext context, VoidCallback openContainer) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              gradient: AnimatedGradient.gradient,
            ),
            child: Container(
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    clipBehavior: Clip.hardEdge,
                    child: marineVehicle.images.isNotEmpty
                        ? Image.network(marineVehicle.images.first, fit: BoxFit.cover)
                        : const Center(child: Text('image')),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    marineVehicle.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text('От ${marineVehicle.price}/час'),
                  const SizedBox(height: 5),
                  Text('Вместимость ${marineVehicle.capacity} чел'),
                  // const SizedBox(height: 5),
                  // Text('Длина катера ${marineVehicle.length} м'),
                  const SizedBox(height: 10),
                  const BookingButtonWidget(),
                ],
              ),
            ),
          );
        },
      ),
    ]);
  }
}
