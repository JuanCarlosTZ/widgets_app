import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterProvider {
  static StateProvider<int> clickCounter = StateProvider<int>((ref) => 0);
}
