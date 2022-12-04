// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_comment.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $updateCommentHash() => r'b619151aea887190022c56aa05b5322eb926d7ee';

/// See also [updateComment].
class UpdateCommentProvider extends AutoDisposeProvider<void> {
  UpdateCommentProvider(
    this.commentId,
  ) : super(
          (ref) => updateComment(
            ref,
            commentId,
          ),
          from: updateCommentProvider,
          name: r'updateCommentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $updateCommentHash,
        );

  final String commentId;

  @override
  bool operator ==(Object other) {
    return other is UpdateCommentProvider && other.commentId == commentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, commentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef UpdateCommentRef = AutoDisposeProviderRef<void>;

/// See also [updateComment].
final updateCommentProvider = UpdateCommentFamily();

class UpdateCommentFamily extends Family<void> {
  UpdateCommentFamily();

  UpdateCommentProvider call(
    String commentId,
  ) {
    return UpdateCommentProvider(
      commentId,
    );
  }

  @override
  AutoDisposeProvider<void> getProviderOverride(
    covariant UpdateCommentProvider provider,
  ) {
    return call(
      provider.commentId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'updateCommentProvider';
}
