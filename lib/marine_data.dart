import 'package:gold_marine/screens/catalog_screen/marine_vehicle.dart';
import 'package:gold_marine/screens/catalog_screen/category.dart';
import 'package:gold_marine/screens/catalog_screen/marine.dart';

class MarineData {
  final List<MarineVehicle> marineVehicles;
  final Set<Category> categories;
  final Set<Marine> marines;

  MarineData({
    required this.marineVehicles,
    required this.categories,
    required this.marines,
  });
}