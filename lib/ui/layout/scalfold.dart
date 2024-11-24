import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_production_boilerplate_riverpod/config/destinations.dart';

class ScaffoldLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldLayout({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: navigationShell.goBranch,
        destinations: navbarDestinations.map(
          (Destination destination) {
            return NavigationDestination(
              label: destination.name,
              icon: Icon(destination.icon),
              selectedIcon: Icon(destination.icon),
            );
          },
        ).toList(),
      ),
    );
  }
}
