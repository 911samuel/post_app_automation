import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:post_app_testing/core/theme.dart';
import 'package:post_app_testing/data/repositories/post_repository.dart';
import 'package:post_app_testing/data/services/post_service.dart';
import 'package:post_app_testing/ui/post/view/post_screen.dart';
import 'package:post_app_testing/ui/post/view_model/posts_view_modal.dart';
import 'package:provider/provider.dart';

void main() {
  Widget createWidgetUnderTest({required Widget child}) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => PostService()),
        Provider<PostRepository>(
          create: (context) => PostRepositoryImpl(context.read<PostService>()),
        ),
        ChangeNotifierProvider(
          create: (context) => PostsViewModal(context.read<PostRepository>()),
        ),
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
      ],
      child: MaterialApp(home: child),
    );
  }
  testWidgets('App launches with PostsScreen as home', (tester) async {

  await tester.pumpWidget(createWidgetUnderTest(child: const PostsScreen()));
  await tester.pumpAndSettle();

  expect(find.byType(PostsScreen), findsOneWidget);
  expect(find.byType(MaterialApp), findsOneWidget);
  });
}
