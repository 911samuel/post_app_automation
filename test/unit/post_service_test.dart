import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:post_app_testing/data/services/post_service.dart';
import 'package:post_app_testing/domain/model/post.dart';

class MockPostService extends Mock implements PostService {}
  void main() {
    late PostService sut;
    late MockPostService mockPostService;

    setUp(() {
      mockPostService = MockPostService();
      sut = mockPostService;
    });
test('fetchPosts returns list of posts', () async {
    // Arrange
    final mockPosts = [
      Post(
        title: 'Test Title',
        description: 'Test Description',
        image: 'http://example.com/image.jpg',
        date: '10/05/2024',
      ),
    ];

    when(() => mockPostService.fetchPosts()).thenAnswer((_) async => mockPosts);

    // Act
    final result = await sut.fetchPosts();

    // Assert
    expect(result, mockPosts);
    verify(() => mockPostService.fetchPosts()).called(1);
  });

  test('fetchPosts throws an exception on failure', () async {
    // Arrange
    when(
      () => mockPostService.fetchPosts(),
    ).thenThrow(Exception('Network error'));

    // Act & Assert
    expect(() async => await sut.fetchPosts(), throwsException);
  });
}
