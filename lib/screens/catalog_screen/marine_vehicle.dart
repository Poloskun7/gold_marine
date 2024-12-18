class MarineVehicle {
  final int id;
  final int typeId;
  final List<String> images;
  final String name;
  final int capacity;
  final double? length;
  final String? nameMarina;
  final String? addressMarina;
  final String description;
  final int? price;

  MarineVehicle(
      {
        required this.id,
      required this.typeId,
      required this.images,
      required this.name,
      required this.length,
      required this.nameMarina,
      required this.addressMarina,
      required this.capacity,
      required this.description,
      required this.price
      });
}
