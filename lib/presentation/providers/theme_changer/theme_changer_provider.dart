import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final colorListProvider = Provider((ref) => colorList);
final colorIndexProvider = StateProvider((ref) => 0);
final StateProvider<bool> dartModeProvider =
    StateProvider<bool>((ref) => false);
