import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'selected_post_id_provider.dart';

part 'update_comment.g.dart';

@riverpod
void updateComment(UpdateCommentRef ref, String commentId) {
  FirebaseFirestore.instance
      .collection("posts")
      .doc(ref.read(selectedPostIdProvider))
      .collection("comments")
      .doc(commentId)
      .update({"likes": FieldValue.increment(1)});
}
