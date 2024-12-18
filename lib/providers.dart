import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gold_marine/services/api_service.dart';
import 'package:gold_marine/marine_data.dart';

final marineDataProvider = FutureProvider<MarineData>((ref) async {
  return await ApiService.getMarineData();
});
final selectedCategoryIdProvider = StateProvider<int>((ref) => 1);
final maxPriceProvider = StateProvider<int>((ref) => 200000);
final maxCapacityProvider = StateProvider<int>((ref) => 150);
final filterAdressesButtonProvider = StateProvider<bool>((ref) => false);
final isSearchProvider = StateProvider<bool>((ref) => false);