import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:post_app_testing/data/repositories/post_repository.dart';
import 'package:post_app_testing/data/services/post_service.dart';
import 'package:post_app_testing/domain/model/post.dart';

// 1. Mock the PostService
class MockPostService extends Mock implements PostService {}

void main() {
  late PostRepositoryImpl repository;
  late MockPostService mockPostService;

  setUp(() {
    mockPostService = MockPostService();
    repository = PostRepositoryImpl(mockPostService);
  });

  test('fetchPosts returns list of posts from service', () async {
    // 2. Arrange
    final mockPosts = [
      Post(
        title: 'Test Post',
        description: 'Some description',
        image: 'http://example.com/image.jpg',
        date: '10/05/2024',
      ),
    ];

    when(() => mockPostService.fetchPosts()).thenAnswer((_) async => mockPosts);

    // 3. Act
    final result = await repository.fetchPosts();

    // 4. Assert
    expect(result, mockPosts);
    verify(() => mockPostService.fetchPosts()).called(1);
  });

  test('fetchPosts throws exception when service fails', () async {
    // Arrange
    when(() => mockPostService.fetchPosts()).thenThrow(Exception('Failed'));

    // Act & Assert
    expect(() async => await repository.fetchPosts(), throwsException);
  });
}
