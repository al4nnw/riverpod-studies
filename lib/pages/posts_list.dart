import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps/domain/post.dart';
import 'package:steps/pages/inspect_page.dart';
import 'package:steps/providers/fetch_posts.dart';
import 'package:steps/providers/selected_post_id_provider.dart';

class PostsList extends ConsumerStatefulWidget {
  const PostsList({super.key});

  @override
  ConsumerState<PostsList> createState() => _PostsListState();
}

class _PostsListState extends ConsumerState<PostsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts List")),
      body: StreamBuilder(
          stream: ref.watch(listenPostsProvider),
          builder: ((context, snapshot) {
            final data = snapshot.data;
            if (snapshot.hasData && data != null) {
              if (data.size == 0) {
                return const Center(
                  child: Text("Empty list"),
                );
              }
              return ListView.builder(
                itemCount: data.docs.length,
                itemBuilder: (context, index) {
                  return PostCard(post: data.docs[index].data());
                },
              );
            }
            return const Center(
              child: Text("Error"),
            );
          })),
    );
  }
}

class PostCard extends ConsumerWidget {
  final Post post;
  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () {
        ref.read(selectedPostIdProvider.notifier).especifyId(post.id);
        Navigator.push(context, MaterialPageRoute(builder: (context) => const InspectPost()));
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("New post from", style: Theme.of(context).textTheme.headline6),
                  const SizedBox(height: 4),
                  Text(post.author),
                ],
              ),
              const Icon(Icons.arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}
