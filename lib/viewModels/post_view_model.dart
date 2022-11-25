import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:riverpod_test/models/post.dart';
import 'package:riverpod_test/http_client.dart';
part 'post_view_model.freezed.dart';

@freezed
class PostState with _$PostState {
  const factory PostState({
    @Default([]) List<Post> postList,
    @Default(true) bool isLoading,
  }) = _PostState;

  const PostState._();
}

final postProvider = StateNotifierProvider<PostNotifier, PostState>(
  (ref) => PostNotifier(),
);

class PostNotifier extends StateNotifier<PostState> {
  PostNotifier() : super(const PostState()) {
    loadPosts();
  }

  Future<void> loadPosts() async {
    final res = await httpClient.get('/posts');
    final posts = (res.data as List<dynamic>)
        .map((dynamic post) => Post.fromJson(post as Map<String, dynamic>))
        .toList();
    state = state.copyWith(postList: posts, isLoading: false);
  }

  Future<Post> loadPost(String id) async {
    final res = await httpClient.get('/posts/$id');
    final post = Post.fromJson(res.data['post'] as Map<String, dynamic>);
    return post;
  }
}
