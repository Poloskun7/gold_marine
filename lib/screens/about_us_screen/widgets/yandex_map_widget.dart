import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:yandex_maps_mapkit_lite/mapkit.dart';
import 'package:yandex_maps_mapkit_lite/mapkit_factory.dart';
import 'package:yandex_maps_mapkit_lite/yandex_map.dart';
import 'package:yandex_maps_mapkit_lite/image.dart' as image_provider;

class YandexMapWidget extends StatefulWidget {
  const YandexMapWidget({super.key});

  @override
  State<YandexMapWidget> createState() => _YandexMapWidgetState();
}

class _YandexMapWidgetState extends State<YandexMapWidget> with WidgetsBindingObserver {
  MapWindow? _mapWindow;
  double _currentZoom = 17.0; // Начальный уровень масштабирования

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      mapkit.onStart();
    } else if (state == AppLifecycleState.paused) {
      mapkit.onStop();
    }
  }

  void _zoomIn() {
    setState(() {
      _currentZoom += 1.0; // Увеличиваем уровень масштабирования
      var currentPos = _mapWindow?.map.cameraPosition;
      double currentLatitude = currentPos!.target.latitude;
      double currentLongitude = currentPos.target.longitude;
      _mapWindow?.map.move(CameraPosition(
        Point(latitude: currentLatitude, longitude: currentLongitude),
        zoom: _currentZoom,
        azimuth: 0.0,
        tilt: 30.0,
      ));
    });
  }

  void _zoomOut() {
    setState(() {
      _currentZoom -= 1.0; // Уменьшаем уровень масштабирования
      _mapWindow?.map.move(CameraPosition(
        const Point(latitude: 59.941095, longitude: 30.221387),
        zoom: _currentZoom,
        azimuth: 0.0,
        tilt: 30.0,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
            onMapCreated: (mapWindow) {
              _mapWindow = mapWindow;
              mapkit.onStart();
              _mapWindow?.map.move(CameraPosition(
                const Point(latitude: 59.941095, longitude: 30.221387),
                zoom: _currentZoom,
                azimuth: 0.0,
                tilt: 30.0,
              ));

              // final placemark = mapWindow.map.mapObjects.addPlacemark()
              //   ..geometry =
              //       const Point(latitude: 59.941095, longitude: 30.221387)
              //   ..setIcon(image_provider.ImageProvider.fromImageProvider(
              //       const AssetImage("assets/image/rb_25530.png")))
              //   ..setIconStyle(
              //     const IconStyle(
              //       anchor: math.Point(0.5, 1.0),
              //       scale: 0.1,
              //     ),
              //   );

              void addMarkers() {
                const centerLatitude = 59.941095;
                const centerLongitude = 30.221387;
                const radiusInMeters = 50;
                const numberOfMarkers = 5;

                for (int i = 0; i < numberOfMarkers; i++) {
                  final randomAngle = math.Random().nextDouble() *
                      2 * math.pi; 
                  final randomDistance = math.Random().nextDouble() *
                      radiusInMeters; 

                  final newLatitude = centerLatitude +
                      (randomDistance / 111320) * math.cos(randomAngle);
                  final newLongitude = centerLongitude +
                      (randomDistance /
                              (111320 *
                                  math.cos(centerLatitude * math.pi / 180))) *
                          math.sin(randomAngle);

                  final placemark = mapWindow.map.mapObjects.addPlacemark()
                    ..geometry =
                        Point(latitude: newLatitude, longitude: newLongitude)
                    ..setIcon(image_provider.ImageProvider.fromImageProvider(
                        const AssetImage("assets/image/rb_25530.png")))
                    ..setIconStyle(
                      const IconStyle(
                        anchor: math.Point(0.5, 1.0),
                        scale: 0.1,
                      ),
                    );
                }
              }

              addMarkers();
            },
          ),
          Positioned(
            bottom: 20,
            right: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton.small(
                  heroTag: "btn__map_plus",
                  backgroundColor: Colors.white60,
                  onPressed: _zoomIn,
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 8),
                FloatingActionButton.small(
                  heroTag: "btn__map_minus",
                  backgroundColor: Colors.white60,
                  onPressed: _zoomOut,
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton.small(
                  heroTag: "btn__map_extra",
                  backgroundColor: Colors.white60,
                  onPressed: _zoomIn,
                  child: const Icon(Icons.location_on),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
