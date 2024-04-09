import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final colorListProvider = Provider((ref) => colorList);
final colorIndexProvider = StateProvider((ref) => 0);
final StateProvider<bool> dartModeProvider =
    StateProvider<bool>((ref) => false);

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme(selectedColor: 0));

  changeDarMode() {
    // state.changeDartMode();
    // state = state..changeDartMode();
    state = state.copyWith(isDartMode: !state.isDartMode);
  }

  changeColorScheme(int indexColor) {
    state = state.copyWith(selectedColor: indexColor);
  }
}
