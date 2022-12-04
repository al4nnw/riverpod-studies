import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/post.dart';

Future sendPost(Post post) async {
  FirebaseFirestore.instance.collection("posts").doc().set(post.toFirestore());
}
