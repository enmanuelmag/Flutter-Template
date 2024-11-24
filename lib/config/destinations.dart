import 'package:flutter/material.dart';

class Destination {
  final String name;
  final IconData icon;

  Destination({
    required this.name,
    required this.icon,
  });
}

List<Destination> navbarDestinations = <Destination>[
  Destination(name: 'Home', icon: Icons.home),
  Destination(name: 'Settings', icon: Icons.settings),
];
