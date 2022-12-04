class Post {
  String id;
  String text;
  String author;
  DateTime timestamp;

  Post({required this.id, required this.text, required this.author, required this.timestamp});

  factory Post.fromFirestore(Map postContent, String id) {
    return Post(
        id: id,
        text: postContent["text"],
        author: postContent["author"],
        timestamp: postContent["timestamp"].toDate());
  }

  toFirestore() => {"text": text, "author": author, "timestamp": timestamp};
}
