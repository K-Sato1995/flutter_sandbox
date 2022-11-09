import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/viewModels/counter_view_model.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterNotifierProvider);
    final notifier = ref.watch(counterNotifierProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Column(children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
        ElevatedButton(
          onPressed: () {
            notifier.increment();
          },
          child: const Text('Add!'),
        ),
        ElevatedButton(
          onPressed: () {
            notifier.decrement();
          },
          child: const Text('decrement!'),
        ),
        Text(
          '$counter',
          style: Theme.of(context).textTheme.headline4,
        ),
      ]),
    );
  }
}
