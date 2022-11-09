import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_test/todo_noti_provider.dart';
import 'package:riverpod_test/models/todo.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListNotifierProvider);
    final notifier = ref.watch(todoListNotifierProvider.notifier);

    void addTodo() {
      final newTodo = Todo(
        id: DateTime.now().toString(),
        title: 'Todo ${todoList.length + 1}',
        completed: false,
      );
      notifier.add(newTodo);
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo'),
        ),
        bottomNavigationBar: Row(children: [
          ElevatedButton(
            onPressed: () {
              addTodo();
            },
            child: const Text('Add todo'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
        ]),
        body: Center(
          child: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              final todo = todoList[index];
              return ListTile(
                // TodoのタイトルをTextで表示
                title: Text(todo.title),
                leading: Icon(
                  todo.completed
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                ),
                trailing: TextButton(
                  onPressed: () => notifier.remove(todo),
                  child: const Text('Delete'),
                ),
                // タップでTODOの完了状態を切り替える
                onTap: () => notifier.toggle(todo.id),
              );
            },
          ),
        ));
  }
}
