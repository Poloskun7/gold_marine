import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gold_marine/navigation.dart';
import 'package:yandex_maps_mapkit_lite/init.dart' as init;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init.initMapkit(
      apiKey: '6bbe28dd-6196-432d-9055-ab106dee7731'
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.blue[900],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
    ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          surface: Colors.transparent,
        ),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Navigation(initialIndex: 0);
      },
    ),
    GoRoute(
      path: '/catalog',
      builder: (BuildContext context, GoRouterState state) {
        return const Navigation(initialIndex: 1);
      },
    ),
    GoRoute(
      path: '/about_us',
      builder: (BuildContext context, GoRouterState state) {
        return const Navigation(initialIndex: 2);
      },
    ),
  ],
);
