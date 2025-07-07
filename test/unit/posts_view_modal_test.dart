import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:post_app_testing/data/repositories/post_repository.dart';
import 'package:post_app_testing/domain/model/post.dart';
import 'package:post_app_testing/ui/post/view_model/posts_view_modal.dart';
import 'posts_view_modal_test.mocks.dart';

@GenerateMocks([PostRepository])

void main() {
  late MockPostRepository mockRepository;
  late PostsViewModal viewModel;

  setUp(() {
    mockRepository = MockPostRepository();
    viewModel = PostsViewModal(mockRepository);
  });

  test('initial state is correct', () {
    expect(viewModel.posts, isEmpty);
    expect(viewModel.isLoading, isFalse);
    expect(viewModel.errorMessage, isNull);
  });

  test('fetchPosts succeeds and updates posts', () async {
    final postsList = [Post(
        title: 'Test Post',
        description: 'This is a description.',
        image: 'https://example.com/image.jpg',
        date: '2025-06-27',
      )];
    when(mockRepository.fetchPosts()).thenAnswer((_) async => postsList);

    await viewModel.fetchPosts();

    expect(viewModel.isLoading, isFalse);
    expect(viewModel.posts, postsList);
    expect(viewModel.errorMessage, isNull);
  });

  test('fetchPosts handles SocketException', () async {
    when(
      mockRepository.fetchPosts(),
    ).thenThrow(SocketException('No connection'));

    await viewModel.fetchPosts();

    expect(viewModel.isLoading, isFalse);
    expect(viewModel.posts, isEmpty);
    expect(viewModel.errorMessage, contains('No internet connection'));
  });

  test('fetchPosts handles generic error', () async {
    when(mockRepository.fetchPosts()).thenThrow(Exception('Unexpected error'));

    await viewModel.fetchPosts();

    expect(viewModel.isLoading, isFalse);
    expect(viewModel.posts, isEmpty);
    expect(viewModel.errorMessage, contains('Failed to load posts'));
  });
}
