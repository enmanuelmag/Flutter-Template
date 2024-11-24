// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:flutter_production_boilerplate_riverpod/ui/layout/scalfold.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_production_boilerplate_riverpod/ui/screens/screens.barrel.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

// GoRouter configuration
final GoRouter routerConfig = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: FirstScreen.path,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          ScaffoldLayout(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: FirstScreen.path,
              builder: (BuildContext context, GoRouterState state) =>
                  FirstScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: SecondScreen.path,
              builder: (BuildContext context, GoRouterState state) =>
                  SecondScreen(),
            ),
          ],
        )
      ],
    )
  ],
);



 // pageBuilder: (context, state) {
              //   return CustomTransitionPage(
              //     key: state.pageKey,
              //     child: FirstScreen(),
              //     transitionsBuilder:
              //         (context, animation, secondaryAnimation, child) {
              //       // Change the opacity of the screen using a Curve based on the the animation's
              //       // value
              //       return FadeTransition(
              //         opacity: CurveTween(curve: Curves.easeInOutCirc)
              //             .animate(animation),
              //         child: child,
              //       );
              //     },
              //   );
              // },