import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'theme_mode_state.g.dart';

@riverpod
class MyTheme extends _$MyTheme {
  @override
  ThemeMode build() {
    final String mode = Hive.box<dynamic>('prefs')
        .get('themeMode', defaultValue: ThemeMode.system.toString()) as String;

    switch (mode) {
      case 'ThemeMode.dark':
        return ThemeMode.dark;
      case 'ThemeMode.light':
        return ThemeMode.light;
      case 'ThemeMode.system':
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    Hive.box<dynamic>('prefs').put('themeMode', mode.toString());

    ref.invalidateSelf();
  }
}


// final AutoDisposeChangeNotifierProvider<ThemeModeState> themeProvider =
//     ChangeNotifierProvider.autoDispose(
//         (AutoDisposeChangeNotifierProviderRef<ThemeModeState> ref) {
//   return ThemeModeState();
// });

// class ThemeModeState extends ChangeNotifier {
//   ThemeModeState() {
//     final String mode = Hive.box<dynamic>('prefs')
//         .get('themeMode', defaultValue: ThemeMode.system.toString()) as String;
//     switch (mode) {
//       case 'ThemeMode.dark':
//         themeMode = ThemeMode.dark;
//         break;
//       case 'ThemeMode.light':
//         themeMode = ThemeMode.light;
//         break;
//       case 'ThemeMode.system':
//         themeMode = ThemeMode.system;
//         break;
//     }
//   }

//   ThemeMode? themeMode;

//   void setThemeMode(ThemeMode mode) {
//     themeMode = mode;
//     Hive.box<dynamic>('prefs').put('themeMode', themeMode.toString());
//     notifyListeners();
//   }
// }
