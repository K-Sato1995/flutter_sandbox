import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final counter = ref.watch(countProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sample App',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: Center(child: Consumer(builder: (context, ref, _) {
        final count = ref.watch(countProvider);
        return Text(
          '$count',
          style: Theme.of(context).textTheme.headline4,
        );
      })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.state++;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
