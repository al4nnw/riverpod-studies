import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/post.dart';

part 'fetch_posts.g.dart';

@riverpod
Stream<QuerySnapshot<Post>> listenPosts(ListenPostsRef ref) {
  return FirebaseFirestore.instance
      .collection("posts")
      .orderBy("timestamp")
      .withConverter<Post>(
          fromFirestore: (data, _) => Post.fromFirestore(data.data()!, data.id),
          toFirestore: (post, __) => post.toFirestore())
      .snapshots();
}
