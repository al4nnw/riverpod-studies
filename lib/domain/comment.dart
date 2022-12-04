class Comment {
  String id;
  int likes;
  String content;
  DateTime timestamp;

  Comment({required this.likes, required this.content, required this.id, required this.timestamp});

  factory Comment.fromFirestore(Map content, String id) {
    return Comment(
        likes: content["likes"],
        content: content["content"],
        id: id,
        timestamp: content["timestamp"].toDate());
  }

  toFirestore() => {"likes": likes, "content": content, "timestamp": timestamp};
}
