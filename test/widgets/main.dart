import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:post_app_testing/main.dart' as app;
import 'package:post_app_testing/ui/post/view/post_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App starts and shows PostsScreen', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(PostsScreen), findsOneWidget);
  });
}
