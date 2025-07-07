import 'package:flutter_test/flutter_test.dart';
import 'package:post_app_testing/domain/model/post.dart';

void main() {
  group('Post.fromJson', () {
    test('should create a Post object from JSON', () {
      final json = {
        'urlToImage': 'https://example.com/image.jpg',
        'title': 'Test Title',
        'description': 'This is a test description.',
        'publishedAt': '2025-07-01',
      };

      final post = Post.fromJson(json);

      expect(post.title, 'Test Title');
      expect(post.image, 'https://example.com/image.jpg');
      expect(post.description, 'This is a test description.');
      expect(post.date, '2025-07-01');
    });

    test('handles null fields', () {
       final json = {
        'urlToImage': null,
        'title': null,
        'description': null,
        'publishedAt': null,
      };

      final post = Post.fromJson(json);

      expect(post.title, isNull);
      expect(post.image, isNull);
      expect(post.description, isNull);
      expect(post.date, isNull);
    });
    test('handles missing fields', () {
      final Map<String, dynamic> json = {}; // no keys

      final post = Post.fromJson(json);

      expect(post.image, isNull);
      expect(post.title, isNull);
      expect(post.description, isNull);
      expect(post.date, isNull);
    });
  });
}
