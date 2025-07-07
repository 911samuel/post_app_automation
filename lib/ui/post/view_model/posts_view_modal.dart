import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:post_app_testing/data/repositories/post_repository.dart';
import 'package:post_app_testing/domain/model/post.dart';
import 'package:post_app_testing/utils/command.dart';
import 'package:post_app_testing/utils/result.dart';



class PostsViewModal extends ChangeNotifier {
  PostsViewModal(this._repository) {
    fetchPostsCommand.addListener(() {
      // Defer notifyListeners to avoid calling during build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    });
  }
  final PostRepository _repository;

  List<Post> get posts => fetchPostsCommand.result is Ok<List<Post>>
      ? (fetchPostsCommand.result as Ok<List<Post>>).value
      : [];
  bool get isLoading => fetchPostsCommand.running;
  String? get errorMessage => fetchPostsCommand.result is Error<List<Post>>
      ? (fetchPostsCommand.result as Error<List<Post>>).error.toString()
      : null;

  late final Command0<List<Post>> fetchPostsCommand = Command0<List<Post>>(() async {
    try {
      final posts = await _repository.fetchPosts();
      return Result.ok(posts);
    } on SocketException {
      return Result.error(Exception('No internet connection'));
    } on HttpException {
      return Result.error(Exception('Could not fetch posts'));
    } on FormatException {
      return Result.error(Exception('Bad response format'));
    } catch (e) {
      return Result.error(Exception('Failed to load posts: \$e'));
    }
  });

  Future<void> fetchPosts() async {
    await fetchPostsCommand.execute();
  }
}
