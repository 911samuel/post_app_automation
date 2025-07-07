import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:post_app_testing/core/theme.dart';
import 'package:post_app_testing/core/ui/post_card.dart';
import 'package:post_app_testing/ui/post/view_model/posts_view_modal.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostsScreen> {
  @override
  @override
  void initState() {
    super.initState();
    final viewModal = Provider.of<PostsViewModal>(context, listen: false);
    viewModal.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    final viewModal = Provider.of<PostsViewModal>(context);
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("News Articles"),
        actions: [
          IconButton(
            icon: Icon(
              themeNotifier.themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              themeNotifier.toggleTheme();
            },
            tooltip: 'Toggle Theme',
          ),
        ],
      ),
      body: _builBody(viewModal),
    );
  }

  Widget _builBody(PostsViewModal viewModal) {
    if (viewModal.isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (viewModal.errorMessage != null) {
      return Center(child: Text(viewModal.errorMessage!));
    }

    return ListView.builder(
      itemCount: viewModal.posts.length,
      itemBuilder: (BuildContext context, int index) {
        final item = viewModal.posts[index];
        return PostCard(
          imageUrl: item.image ?? '',
          title: item.title ?? '',
          description: item.description ?? '',
          date: item.date ?? '',
        );
      },
    );
  }
}
