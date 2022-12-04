import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:steps/domain/comment.dart';

import 'selected_post_id_provider.dart';

part 'send_comment.g.dart';

@riverpod
Future sendComment(SendCommentRef ref, Comment data) async {
  FirebaseFirestore.instance
      .collection("posts")
      .doc(ref.read(selectedPostIdProvider))
      .collection("comments")
      .doc()
      .set(data.toFirestore());
}
