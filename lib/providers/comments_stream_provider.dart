import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:steps/domain/comment.dart';

import 'selected_post_id_provider.dart';

part 'comments_stream_provider.g.dart';

@riverpod
Stream<QuerySnapshot<Comment>> getComments(GetCommentsRef ref) {
  return FirebaseFirestore.instance
      .collection("posts")
      .doc(ref.read(selectedPostIdProvider))
      .collection("comments")
      .orderBy("timestamp")
      .withConverter(
          fromFirestore: (data, _) => Comment.fromFirestore(data.data()!, data.id),
          toFirestore: (comment, _) => comment.toFirestore())
      .snapshots();
}
