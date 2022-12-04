import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:steps/domain/comment.dart';
import 'package:steps/pages/new_post_page.dart';
import 'package:steps/providers/post_stream_provider.dart';
import 'package:steps/providers/send_comment.dart';
import 'package:steps/providers/update_comment.dart';

import '../providers/comments_stream_provider.dart';

class InspectPost extends ConsumerStatefulWidget {
  const InspectPost({super.key});

  @override
  ConsumerState<InspectPost> createState() => _InspectPostState();
}

class _InspectPostState extends ConsumerState<InspectPost> {
  final commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("Inspecting...")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        color: Colors.grey[900],
        width: size.width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: InputF(label: "Add comment", controller: commentController, hint: "Insert Comment")),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                ref.read(sendCommentProvider(Comment(
                    likes: 0, content: commentController.value.text, id: "", timestamp: DateTime.now())));
                reset();
              },
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: StreamBuilder(
            stream: ref.watch(postStreamProvider),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${snapshot.data!.author} said:", style: Theme.of(context).textTheme.headline4),
                      const SizedBox(height: 4),
                      Text(snapshot.data!.text, style: Theme.of(context).textTheme.headline6),
                      const SizedBox(height: 4),
                      const Expanded(child: CommentSection()),
                    ],
                  ),
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Error"),
                );
              }
              return const Center(
                child: Text("Loading"),
              );
            }),
      ),
    );
  }

  void reset() {
    commentController.clear();
    FocusScope.of(context).unfocus();
  }
}

class CommentSection extends ConsumerStatefulWidget {
  const CommentSection({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends ConsumerState<CommentSection> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.read(getCommentsProvider),
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (snapshot.hasData && data != null && data.docs.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("People responded with:", style: Theme.of(context).textTheme.headline5),
                const SizedBox(height: 4),
                Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: data.docs.length,
                        itemBuilder: (context, index) {
                          return CommentCard(content: data.docs[index].data());
                        }))
              ],
            );
          }
          return Container();
        });
  }
}

class CommentCard extends ConsumerWidget {
  final Comment content;
  const CommentCard({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onDoubleTap: () {
            ref.read(updateCommentProvider(content.id));
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(width: double.infinity, child: Text(content.content)),
            ),
          ),
        ),

        // Add the floating badge with the likes counter
        Visibility(
          visible: content.likes > 0,
          child: Positioned(
            bottom: -4,
            right: 16.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
                child: Text(
                  "${content.likes}  ❤️",
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
