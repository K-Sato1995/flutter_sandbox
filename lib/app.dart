import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ui/counter_page.dart';
import 'ui/todo_page.dart';
import 'ui/api_page.dart';

final countProvider = StateProvider((ref) => 0);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sample App',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Center(child: Consumer(builder: (context, ref, _) {
        return Column(children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CounterPage()),
              );
            },
            child: const Text('counter'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const APIPage()),
              );
            },
            child: const Text('api'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TodoPage()),
              );
            },
            child: const Text('todo list'),
          ),
        ]);
      })),
    );
  }
}
