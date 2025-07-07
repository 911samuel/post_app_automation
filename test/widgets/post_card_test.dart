import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:post_app_testing/core/ui/post_card.dart';

void main() {
  testWidgets('post card displays imageUrl, title, description and date', (
    tester,
  ) async {
    // sample mock data 
    const imageUrl = 'https://example.com/image.jpg';
    const title = 'Test Post';
    const description = 'This is a description.';
    const date = '2025-06-27';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PostCard(
            date: date,
            description: description,
            imageUrl: imageUrl,
            title: title,
          ),
        ),
      ),
    );

    // Wait for images/loaders to settle
    await tester.pumpAndSettle();

    //assert
    expect(find.text(title), findsOneWidget);
    expect(find.text(description), findsOneWidget);
    expect(find.text(date), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(SizedBox), findsAtLeastNWidgets(2));
  });
}
