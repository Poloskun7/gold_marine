import 'package:dio/dio.dart';
import 'package:gold_marine/marine_data.dart';
import 'package:gold_marine/screens/catalog_screen/marine_vehicle.dart';
import 'package:gold_marine/screens/catalog_screen/category.dart';
import 'package:gold_marine/screens/catalog_screen/marine.dart';

class ApiService {
  static Future<MarineData> getMarineData() async {
    final List<MarineVehicle> marineVehicles = [];
    final Set<Category> categories = {};
    final Set<Marine> marines = {};

    void addCategory(var category) {
      if (categories.any(
          (existingButton) => existingButton.id == category['type']['id'])) {
        return;
      }
      categories.add(
          Category(id: category['type']['id'], name: category['type']['name']));
    }

    void addMarine(var marina) {
      if (marines.any(
          (existingButton) => existingButton.id == marina['marina']['id'])) {
        return;
      }
      marines.add(
          Marine(id: marina['marina']['id'], name: marina['marina']['name'], address: marina['marina']['address'], lat: marina['marina']['latitude'], lon: marina['marina']['longitude']));
    }

    var headers = {
      'sltoken': '32232',
    };

    final dio = Dio();
    final response = await dio.get('https://r24api.photonhost.net/gm/vessel/',
        options: Options(headers: headers));

    if (response.statusCode == 200) {
      for (var item in response.data) {
        addCategory(item);
        if (item['marina'] != null) {
          addMarine(item);
        }
        marineVehicles.add(MarineVehicle(
            id: item['id'],
            typeId: item['type']['id'],
            images: List<String>.from(
              item['images'].map((item) => item['image'] as String),
            ),
            name: item['name'],
            length: item['length'],
            capacity: item['capacity'],
            nameMarina: item['marina'] != null ? item['marina']['name'] : null,
            addressMarina: item['marina'] != null ? item['marina']['address']: null,
            description: item['description'],
            price: item['price']));
      }
    } else {
      throw Exception('Failed to load marine data');
    }
    return MarineData(marineVehicles: marineVehicles, categories: categories, marines: marines);
  }
}
