import 'package:flutter/material.dart';
import 'package:steps/domain/post.dart';
import 'package:steps/providers/send_post.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key});

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  final authorController = TextEditingController();
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Post")),
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Column(
          children: [
            InputF(
              label: "Author's name",
              controller: authorController,
              hint: "Insert name",
            ),
            InputF(
              label: "Post content",
              controller: textController,
              hint: "Insert content",
              shouldExpand: true,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300], borderRadius: const BorderRadius.all(Radius.circular(4))),
              child: TextButton(
                child: const Text("Send Post"),
                onPressed: () {
                  sendPost(Post(
                      id: "",
                      author: authorController.value.text,
                      text: textController.value.text,
                      timestamp: DateTime.now()));
                  reset();
                  FocusScope.of(context).unfocus();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void reset() {
    authorController.clear();
    textController.clear();
  }
}

class InputF extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;
  final bool expand;
  const InputF(
      {Key? key, required this.label, required this.controller, required this.hint, bool? shouldExpand})
      : expand = shouldExpand ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Colors.grey[300],
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child:
                    Text(label, style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black))),
            const SizedBox(height: 4),
            TextFormField(
              controller: controller,
              decoration: InputDecoration(hintText: hint, filled: true, fillColor: Colors.grey[600]),
              maxLines: expand ? 3 : 1,
            ),
          ],
        ),
      ),
    );
  }
}
