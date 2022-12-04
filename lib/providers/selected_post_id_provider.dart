import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_post_id_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedPostId extends _$SelectedPostId {
  @override
  String? build() {
    return null;
  }

  void especifyId(String id) {
    state = id;
  }
}
