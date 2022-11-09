import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/models/counter.dart';

class CounterNotifier extends StateNotifier<Counter> {
  CounterNotifier() : super(const Counter());

  void increment() {
    state = state.copyWith(count: state.count + 1);
  }

  void decrement() {
    state = state.copyWith(count: state.count - 1);
  }
}

final counterNotifierProvider = StateNotifierProvider<CounterNotifier, Counter>(
  (ref) => CounterNotifier(),
);
