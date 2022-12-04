import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/post.dart';
import 'selected_post_id_provider.dart';

part 'post_stream_provider.g.dart';

@riverpod
Stream<Post> postStream(PostStreamRef ref) {
  return FirebaseFirestore.instance
      .collection("posts")
      .doc(ref.watch(selectedPostIdProvider))
      .snapshots()
      .map((event) => Post.fromFirestore(event.data()!, event.id));
}
