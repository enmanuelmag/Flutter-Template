import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_nav_bar_state.g.dart';

@riverpod
class BottomNav extends _$BottomNav {
  @override
  int build() {
    return Hive.box<dynamic>('prefs').get('navIndex', defaultValue: 0) as int;
  }

  void setAndPersistValue(int index) {
    Hive.box<dynamic>('prefs').put('navIndex', index);
    ref.invalidateSelf();
  }
}
