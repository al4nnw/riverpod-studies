// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_comment.dart';

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

String $sendCommentHash() => r'd50845a146f39866bce2cd93d6aff4124d48b856';

/// See also [sendComment].
class SendCommentProvider extends AutoDisposeFutureProvider<dynamic> {
  SendCommentProvider(
    this.data,
  ) : super(
          (ref) => sendComment(
            ref,
            data,
          ),
          from: sendCommentProvider,
          name: r'sendCommentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $sendCommentHash,
        );

  final Comment data;

  @override
  bool operator ==(Object other) {
    return other is SendCommentProvider && other.data == data;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, data.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef SendCommentRef = AutoDisposeFutureProviderRef<dynamic>;

/// See also [sendComment].
final sendCommentProvider = SendCommentFamily();

class SendCommentFamily extends Family<AsyncValue<dynamic>> {
  SendCommentFamily();

  SendCommentProvider call(
    Comment data,
  ) {
    return SendCommentProvider(
      data,
    );
  }

  @override
  AutoDisposeFutureProvider<dynamic> getProviderOverride(
    covariant SendCommentProvider provider,
  ) {
    return call(
      provider.data,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'sendCommentProvider';
}
