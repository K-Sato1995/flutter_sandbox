import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/models/todo.dart';

// https://github.com/altive/flutter_app_template/tree/main/packages/flutter_app/lib/src/pages/riverpod_example_page/state_notifier_provider_page
class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void add(Todo todo) {
    state = [...state, todo];
  }

  void remove(Todo todo) {
    state = state.where((element) => element != todo).toList();
  }

  void toggle(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId)
          todo.copyWith(completed: !todo.completed)
        else
          todo,
    ];
  }
}

final todoListNotifierProvider =
    StateNotifierProvider<TodoNotifier, List<Todo>>(
  (ref) => TodoNotifier(),
);
