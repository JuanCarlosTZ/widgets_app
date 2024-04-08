import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeCounterProvider {
  static StateProvider<bool> dartMode = StateProvider<bool>((ref) => false);
}
