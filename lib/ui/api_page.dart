import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/viewModels/post_view_model.dart';
import 'package:riverpod_test/widgets/loader.dart';

class APIPage extends ConsumerWidget {
  const APIPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(postProvider);

    if (postState.isLoading) {
      return const Loader();
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            for (var post in postState.postList)
              ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              ),
          ],
        ));
  }
}
