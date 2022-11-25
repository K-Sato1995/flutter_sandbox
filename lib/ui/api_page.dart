import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/viewModels/post_view_model.dart';
import 'package:riverpod_test/widgets/loader.dart';
import 'package:riverpod_test/models/post.dart';

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
        body: _ItemList(posts: postState.postList));
  }
}

class _ItemList extends StatelessWidget {
  const _ItemList({Key? key, required this.posts}) : super(key: key);
  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        for (var post in posts)
          ListTile(
            title: Text(post.title),
            subtitle: Text(post.body),
          ),
      ],
    );
  }
}
