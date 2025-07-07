import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/theme.dart';

import 'package:post_app_testing/data/repositories/post_repository.dart';
import 'package:post_app_testing/data/services/post_service.dart';
import 'package:post_app_testing/ui/post/view/post_screen.dart';
import 'package:post_app_testing/ui/post/view_model/posts_view_modal.dart';
Future<void> main() async {
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    debugPrint('Error loading .env file: $e');
  }
  runApp(
    MultiProvider(
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
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Articles',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeNotifier.themeMode,
      home: const PostsScreen(),
    );
  }
}
