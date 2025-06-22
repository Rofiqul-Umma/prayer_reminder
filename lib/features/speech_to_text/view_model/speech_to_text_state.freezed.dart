// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'speech_to_text_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SpeechToTextState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String recognizedText) listening,
    required TResult Function() stopped,
    required TResult Function(String message) error,
    required TResult Function() permissionDenied,
    required TResult Function() permissionGranted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String recognizedText)? listening,
    TResult? Function()? stopped,
    TResult? Function(String message)? error,
    TResult? Function()? permissionDenied,
    TResult? Function()? permissionGranted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String recognizedText)? listening,
    TResult Function()? stopped,
    TResult Function(String message)? error,
    TResult Function()? permissionDenied,
    TResult Function()? permissionGranted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SpeechToTextInitialState value) initial,
    required TResult Function(SpeechToTextListeningState value) listening,
    required TResult Function(SpeechToTextStoppedState value) stopped,
    required TResult Function(SpeechToTextErrorState value) error,
    required TResult Function(SpeechToTextPermissionDeniedState value)
        permissionDenied,
    required TResult Function(SpeechToTextPermissionGrantedState value)
        permissionGranted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SpeechToTextInitialState value)? initial,
    TResult? Function(SpeechToTextListeningState value)? listening,
    TResult? Function(SpeechToTextStoppedState value)? stopped,
    TResult? Function(SpeechToTextErrorState value)? error,
    TResult? Function(SpeechToTextPermissionDeniedState value)?
        permissionDenied,
    TResult? Function(SpeechToTextPermissionGrantedState value)?
        permissionGranted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpeechToTextInitialState value)? initial,
    TResult Function(SpeechToTextListeningState value)? listening,
    TResult Function(SpeechToTextStoppedState value)? stopped,
    TResult Function(SpeechToTextErrorState value)? error,
    TResult Function(SpeechToTextPermissionDeniedState value)? permissionDenied,
    TResult Function(SpeechToTextPermissionGrantedState value)?
        permissionGranted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeechToTextStateCopyWith<$Res> {
  factory $SpeechToTextStateCopyWith(
          SpeechToTextState value, $Res Function(SpeechToTextState) then) =
      _$SpeechToTextStateCopyWithImpl<$Res, SpeechToTextState>;
}

/// @nodoc
class _$SpeechToTextStateCopyWithImpl<$Res, $Val extends SpeechToTextState>
    implements $SpeechToTextStateCopyWith<$Res> {
  _$SpeechToTextStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpeechToTextState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SpeechToTextInitialStateImplCopyWith<$Res> {
  factory _$$SpeechToTextInitialStateImplCopyWith(
          _$SpeechToTextInitialStateImpl value,
          $Res Function(_$SpeechToTextInitialStateImpl) then) =
      __$$SpeechToTextInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SpeechToTextInitialStateImplCopyWithImpl<$Res>
    extends _$SpeechToTextStateCopyWithImpl<$Res,
        _$SpeechToTextInitialStateImpl>
    implements _$$SpeechToTextInitialStateImplCopyWith<$Res> {
  __$$SpeechToTextInitialStateImplCopyWithImpl(
      _$SpeechToTextInitialStateImpl _value,
      $Res Function(_$SpeechToTextInitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeechToTextState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SpeechToTextInitialStateImpl implements SpeechToTextInitialState {
  const _$SpeechToTextInitialStateImpl();

  @override
  String toString() {
    return 'SpeechToTextState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeechToTextInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String recognizedText) listening,
    required TResult Function() stopped,
    required TResult Function(String message) error,
    required TResult Function() permissionDenied,
    required TResult Function() permissionGranted,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String recognizedText)? listening,
    TResult? Function()? stopped,
    TResult? Function(String message)? error,
    TResult? Function()? permissionDenied,
    TResult? Function()? permissionGranted,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String recognizedText)? listening,
    TResult Function()? stopped,
    TResult Function(String message)? error,
    TResult Function()? permissionDenied,
    TResult Function()? permissionGranted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SpeechToTextInitialState value) initial,
    required TResult Function(SpeechToTextListeningState value) listening,
    required TResult Function(SpeechToTextStoppedState value) stopped,
    required TResult Function(SpeechToTextErrorState value) error,
    required TResult Function(SpeechToTextPermissionDeniedState value)
        permissionDenied,
    required TResult Function(SpeechToTextPermissionGrantedState value)
        permissionGranted,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SpeechToTextInitialState value)? initial,
    TResult? Function(SpeechToTextListeningState value)? listening,
    TResult? Function(SpeechToTextStoppedState value)? stopped,
    TResult? Function(SpeechToTextErrorState value)? error,
    TResult? Function(SpeechToTextPermissionDeniedState value)?
        permissionDenied,
    TResult? Function(SpeechToTextPermissionGrantedState value)?
        permissionGranted,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpeechToTextInitialState value)? initial,
    TResult Function(SpeechToTextListeningState value)? listening,
    TResult Function(SpeechToTextStoppedState value)? stopped,
    TResult Function(SpeechToTextErrorState value)? error,
    TResult Function(SpeechToTextPermissionDeniedState value)? permissionDenied,
    TResult Function(SpeechToTextPermissionGrantedState value)?
        permissionGranted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SpeechToTextInitialState implements SpeechToTextState {
  const factory SpeechToTextInitialState() = _$SpeechToTextInitialStateImpl;
}

/// @nodoc
abstract class _$$SpeechToTextListeningStateImplCopyWith<$Res> {
  factory _$$SpeechToTextListeningStateImplCopyWith(
          _$SpeechToTextListeningStateImpl value,
          $Res Function(_$SpeechToTextListeningStateImpl) then) =
      __$$SpeechToTextListeningStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String recognizedText});
}

/// @nodoc
class __$$SpeechToTextListeningStateImplCopyWithImpl<$Res>
    extends _$SpeechToTextStateCopyWithImpl<$Res,
        _$SpeechToTextListeningStateImpl>
    implements _$$SpeechToTextListeningStateImplCopyWith<$Res> {
  __$$SpeechToTextListeningStateImplCopyWithImpl(
      _$SpeechToTextListeningStateImpl _value,
      $Res Function(_$SpeechToTextListeningStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeechToTextState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recognizedText = null,
  }) {
    return _then(_$SpeechToTextListeningStateImpl(
      null == recognizedText
          ? _value.recognizedText
          : recognizedText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SpeechToTextListeningStateImpl implements SpeechToTextListeningState {
  const _$SpeechToTextListeningStateImpl(this.recognizedText);

  @override
  final String recognizedText;

  @override
  String toString() {
    return 'SpeechToTextState.listening(recognizedText: $recognizedText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeechToTextListeningStateImpl &&
            (identical(other.recognizedText, recognizedText) ||
                other.recognizedText == recognizedText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recognizedText);

  /// Create a copy of SpeechToTextState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeechToTextListeningStateImplCopyWith<_$SpeechToTextListeningStateImpl>
      get copyWith => __$$SpeechToTextListeningStateImplCopyWithImpl<
          _$SpeechToTextListeningStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String recognizedText) listening,
    required TResult Function() stopped,
    required TResult Function(String message) error,
    required TResult Function() permissionDenied,
    required TResult Function() permissionGranted,
  }) {
    return listening(recognizedText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String recognizedText)? listening,
    TResult? Function()? stopped,
    TResult? Function(String message)? error,
    TResult? Function()? permissionDenied,
    TResult? Function()? permissionGranted,
  }) {
    return listening?.call(recognizedText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String recognizedText)? listening,
    TResult Function()? stopped,
    TResult Function(String message)? error,
    TResult Function()? permissionDenied,
    TResult Function()? permissionGranted,
    required TResult orElse(),
  }) {
    if (listening != null) {
      return listening(recognizedText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SpeechToTextInitialState value) initial,
    required TResult Function(SpeechToTextListeningState value) listening,
    required TResult Function(SpeechToTextStoppedState value) stopped,
    required TResult Function(SpeechToTextErrorState value) error,
    required TResult Function(SpeechToTextPermissionDeniedState value)
        permissionDenied,
    required TResult Function(SpeechToTextPermissionGrantedState value)
        permissionGranted,
  }) {
    return listening(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SpeechToTextInitialState value)? initial,
    TResult? Function(SpeechToTextListeningState value)? listening,
    TResult? Function(SpeechToTextStoppedState value)? stopped,
    TResult? Function(SpeechToTextErrorState value)? error,
    TResult? Function(SpeechToTextPermissionDeniedState value)?
        permissionDenied,
    TResult? Function(SpeechToTextPermissionGrantedState value)?
        permissionGranted,
  }) {
    return listening?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpeechToTextInitialState value)? initial,
    TResult Function(SpeechToTextListeningState value)? listening,
    TResult Function(SpeechToTextStoppedState value)? stopped,
    TResult Function(SpeechToTextErrorState value)? error,
    TResult Function(SpeechToTextPermissionDeniedState value)? permissionDenied,
    TResult Function(SpeechToTextPermissionGrantedState value)?
        permissionGranted,
    required TResult orElse(),
  }) {
    if (listening != null) {
      return listening(this);
    }
    return orElse();
  }
}

abstract class SpeechToTextListeningState implements SpeechToTextState {
  const factory SpeechToTextListeningState(final String recognizedText) =
      _$SpeechToTextListeningStateImpl;

  String get recognizedText;

  /// Create a copy of SpeechToTextState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpeechToTextListeningStateImplCopyWith<_$SpeechToTextListeningStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SpeechToTextStoppedStateImplCopyWith<$Res> {
  factory _$$SpeechToTextStoppedStateImplCopyWith(
          _$SpeechToTextStoppedStateImpl value,
          $Res Function(_$SpeechToTextStoppedStateImpl) then) =
      __$$SpeechToTextStoppedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SpeechToTextStoppedStateImplCopyWithImpl<$Res>
    extends _$SpeechToTextStateCopyWithImpl<$Res,
        _$SpeechToTextStoppedStateImpl>
    implements _$$SpeechToTextStoppedStateImplCopyWith<$Res> {
  __$$SpeechToTextStoppedStateImplCopyWithImpl(
      _$SpeechToTextStoppedStateImpl _value,
      $Res Function(_$SpeechToTextStoppedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeechToTextState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SpeechToTextStoppedStateImpl implements SpeechToTextStoppedState {
  const _$SpeechToTextStoppedStateImpl();

  @override
  String toString() {
    return 'SpeechToTextState.stopped()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeechToTextStoppedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String recognizedText) listening,
    required TResult Function() stopped,
    required TResult Function(String message) error,
    required TResult Function() permissionDenied,
    required TResult Function() permissionGranted,
  }) {
    return stopped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String recognizedText)? listening,
    TResult? Function()? stopped,
    TResult? Function(String message)? error,
    TResult? Function()? permissionDenied,
    TResult? Function()? permissionGranted,
  }) {
    return stopped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String recognizedText)? listening,
    TResult Function()? stopped,
    TResult Function(String message)? error,
    TResult Function()? permissionDenied,
    TResult Function()? permissionGranted,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SpeechToTextInitialState value) initial,
    required TResult Function(SpeechToTextListeningState value) listening,
    required TResult Function(SpeechToTextStoppedState value) stopped,
    required TResult Function(SpeechToTextErrorState value) error,
    required TResult Function(SpeechToTextPermissionDeniedState value)
        permissionDenied,
    required TResult Function(SpeechToTextPermissionGrantedState value)
        permissionGranted,
  }) {
    return stopped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SpeechToTextInitialState value)? initial,
    TResult? Function(SpeechToTextListeningState value)? listening,
    TResult? Function(SpeechToTextStoppedState value)? stopped,
    TResult? Function(SpeechToTextErrorState value)? error,
    TResult? Function(SpeechToTextPermissionDeniedState value)?
        permissionDenied,
    TResult? Function(SpeechToTextPermissionGrantedState value)?
        permissionGranted,
  }) {
    return stopped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpeechToTextInitialState value)? initial,
    TResult Function(SpeechToTextListeningState value)? listening,
    TResult Function(SpeechToTextStoppedState value)? stopped,
    TResult Function(SpeechToTextErrorState value)? error,
    TResult Function(SpeechToTextPermissionDeniedState value)? permissionDenied,
    TResult Function(SpeechToTextPermissionGrantedState value)?
        permissionGranted,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped(this);
    }
    return orElse();
  }
}

abstract class SpeechToTextStoppedState implements SpeechToTextState {
  const factory SpeechToTextStoppedState() = _$SpeechToTextStoppedStateImpl;
}

/// @nodoc
abstract class _$$SpeechToTextErrorStateImplCopyWith<$Res> {
  factory _$$SpeechToTextErrorStateImplCopyWith(
          _$SpeechToTextErrorStateImpl value,
          $Res Function(_$SpeechToTextErrorStateImpl) then) =
      __$$SpeechToTextErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SpeechToTextErrorStateImplCopyWithImpl<$Res>
    extends _$SpeechToTextStateCopyWithImpl<$Res, _$SpeechToTextErrorStateImpl>
    implements _$$SpeechToTextErrorStateImplCopyWith<$Res> {
  __$$SpeechToTextErrorStateImplCopyWithImpl(
      _$SpeechToTextErrorStateImpl _value,
      $Res Function(_$SpeechToTextErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeechToTextState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SpeechToTextErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SpeechToTextErrorStateImpl implements SpeechToTextErrorState {
  const _$SpeechToTextErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SpeechToTextState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeechToTextErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of SpeechToTextState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpeechToTextErrorStateImplCopyWith<_$SpeechToTextErrorStateImpl>
      get copyWith => __$$SpeechToTextErrorStateImplCopyWithImpl<
          _$SpeechToTextErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String recognizedText) listening,
    required TResult Function() stopped,
    required TResult Function(String message) error,
    required TResult Function() permissionDenied,
    required TResult Function() permissionGranted,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String recognizedText)? listening,
    TResult? Function()? stopped,
    TResult? Function(String message)? error,
    TResult? Function()? permissionDenied,
    TResult? Function()? permissionGranted,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String recognizedText)? listening,
    TResult Function()? stopped,
    TResult Function(String message)? error,
    TResult Function()? permissionDenied,
    TResult Function()? permissionGranted,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SpeechToTextInitialState value) initial,
    required TResult Function(SpeechToTextListeningState value) listening,
    required TResult Function(SpeechToTextStoppedState value) stopped,
    required TResult Function(SpeechToTextErrorState value) error,
    required TResult Function(SpeechToTextPermissionDeniedState value)
        permissionDenied,
    required TResult Function(SpeechToTextPermissionGrantedState value)
        permissionGranted,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SpeechToTextInitialState value)? initial,
    TResult? Function(SpeechToTextListeningState value)? listening,
    TResult? Function(SpeechToTextStoppedState value)? stopped,
    TResult? Function(SpeechToTextErrorState value)? error,
    TResult? Function(SpeechToTextPermissionDeniedState value)?
        permissionDenied,
    TResult? Function(SpeechToTextPermissionGrantedState value)?
        permissionGranted,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpeechToTextInitialState value)? initial,
    TResult Function(SpeechToTextListeningState value)? listening,
    TResult Function(SpeechToTextStoppedState value)? stopped,
    TResult Function(SpeechToTextErrorState value)? error,
    TResult Function(SpeechToTextPermissionDeniedState value)? permissionDenied,
    TResult Function(SpeechToTextPermissionGrantedState value)?
        permissionGranted,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SpeechToTextErrorState implements SpeechToTextState {
  const factory SpeechToTextErrorState(final String message) =
      _$SpeechToTextErrorStateImpl;

  String get message;

  /// Create a copy of SpeechToTextState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpeechToTextErrorStateImplCopyWith<_$SpeechToTextErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SpeechToTextPermissionDeniedStateImplCopyWith<$Res> {
  factory _$$SpeechToTextPermissionDeniedStateImplCopyWith(
          _$SpeechToTextPermissionDeniedStateImpl value,
          $Res Function(_$SpeechToTextPermissionDeniedStateImpl) then) =
      __$$SpeechToTextPermissionDeniedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SpeechToTextPermissionDeniedStateImplCopyWithImpl<$Res>
    extends _$SpeechToTextStateCopyWithImpl<$Res,
        _$SpeechToTextPermissionDeniedStateImpl>
    implements _$$SpeechToTextPermissionDeniedStateImplCopyWith<$Res> {
  __$$SpeechToTextPermissionDeniedStateImplCopyWithImpl(
      _$SpeechToTextPermissionDeniedStateImpl _value,
      $Res Function(_$SpeechToTextPermissionDeniedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeechToTextState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SpeechToTextPermissionDeniedStateImpl
    implements SpeechToTextPermissionDeniedState {
  const _$SpeechToTextPermissionDeniedStateImpl();

  @override
  String toString() {
    return 'SpeechToTextState.permissionDenied()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeechToTextPermissionDeniedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String recognizedText) listening,
    required TResult Function() stopped,
    required TResult Function(String message) error,
    required TResult Function() permissionDenied,
    required TResult Function() permissionGranted,
  }) {
    return permissionDenied();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String recognizedText)? listening,
    TResult? Function()? stopped,
    TResult? Function(String message)? error,
    TResult? Function()? permissionDenied,
    TResult? Function()? permissionGranted,
  }) {
    return permissionDenied?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String recognizedText)? listening,
    TResult Function()? stopped,
    TResult Function(String message)? error,
    TResult Function()? permissionDenied,
    TResult Function()? permissionGranted,
    required TResult orElse(),
  }) {
    if (permissionDenied != null) {
      return permissionDenied();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SpeechToTextInitialState value) initial,
    required TResult Function(SpeechToTextListeningState value) listening,
    required TResult Function(SpeechToTextStoppedState value) stopped,
    required TResult Function(SpeechToTextErrorState value) error,
    required TResult Function(SpeechToTextPermissionDeniedState value)
        permissionDenied,
    required TResult Function(SpeechToTextPermissionGrantedState value)
        permissionGranted,
  }) {
    return permissionDenied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SpeechToTextInitialState value)? initial,
    TResult? Function(SpeechToTextListeningState value)? listening,
    TResult? Function(SpeechToTextStoppedState value)? stopped,
    TResult? Function(SpeechToTextErrorState value)? error,
    TResult? Function(SpeechToTextPermissionDeniedState value)?
        permissionDenied,
    TResult? Function(SpeechToTextPermissionGrantedState value)?
        permissionGranted,
  }) {
    return permissionDenied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpeechToTextInitialState value)? initial,
    TResult Function(SpeechToTextListeningState value)? listening,
    TResult Function(SpeechToTextStoppedState value)? stopped,
    TResult Function(SpeechToTextErrorState value)? error,
    TResult Function(SpeechToTextPermissionDeniedState value)? permissionDenied,
    TResult Function(SpeechToTextPermissionGrantedState value)?
        permissionGranted,
    required TResult orElse(),
  }) {
    if (permissionDenied != null) {
      return permissionDenied(this);
    }
    return orElse();
  }
}

abstract class SpeechToTextPermissionDeniedState implements SpeechToTextState {
  const factory SpeechToTextPermissionDeniedState() =
      _$SpeechToTextPermissionDeniedStateImpl;
}

/// @nodoc
abstract class _$$SpeechToTextPermissionGrantedStateImplCopyWith<$Res> {
  factory _$$SpeechToTextPermissionGrantedStateImplCopyWith(
          _$SpeechToTextPermissionGrantedStateImpl value,
          $Res Function(_$SpeechToTextPermissionGrantedStateImpl) then) =
      __$$SpeechToTextPermissionGrantedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SpeechToTextPermissionGrantedStateImplCopyWithImpl<$Res>
    extends _$SpeechToTextStateCopyWithImpl<$Res,
        _$SpeechToTextPermissionGrantedStateImpl>
    implements _$$SpeechToTextPermissionGrantedStateImplCopyWith<$Res> {
  __$$SpeechToTextPermissionGrantedStateImplCopyWithImpl(
      _$SpeechToTextPermissionGrantedStateImpl _value,
      $Res Function(_$SpeechToTextPermissionGrantedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SpeechToTextState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SpeechToTextPermissionGrantedStateImpl
    implements SpeechToTextPermissionGrantedState {
  const _$SpeechToTextPermissionGrantedStateImpl();

  @override
  String toString() {
    return 'SpeechToTextState.permissionGranted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpeechToTextPermissionGrantedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String recognizedText) listening,
    required TResult Function() stopped,
    required TResult Function(String message) error,
    required TResult Function() permissionDenied,
    required TResult Function() permissionGranted,
  }) {
    return permissionGranted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String recognizedText)? listening,
    TResult? Function()? stopped,
    TResult? Function(String message)? error,
    TResult? Function()? permissionDenied,
    TResult? Function()? permissionGranted,
  }) {
    return permissionGranted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String recognizedText)? listening,
    TResult Function()? stopped,
    TResult Function(String message)? error,
    TResult Function()? permissionDenied,
    TResult Function()? permissionGranted,
    required TResult orElse(),
  }) {
    if (permissionGranted != null) {
      return permissionGranted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SpeechToTextInitialState value) initial,
    required TResult Function(SpeechToTextListeningState value) listening,
    required TResult Function(SpeechToTextStoppedState value) stopped,
    required TResult Function(SpeechToTextErrorState value) error,
    required TResult Function(SpeechToTextPermissionDeniedState value)
        permissionDenied,
    required TResult Function(SpeechToTextPermissionGrantedState value)
        permissionGranted,
  }) {
    return permissionGranted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SpeechToTextInitialState value)? initial,
    TResult? Function(SpeechToTextListeningState value)? listening,
    TResult? Function(SpeechToTextStoppedState value)? stopped,
    TResult? Function(SpeechToTextErrorState value)? error,
    TResult? Function(SpeechToTextPermissionDeniedState value)?
        permissionDenied,
    TResult? Function(SpeechToTextPermissionGrantedState value)?
        permissionGranted,
  }) {
    return permissionGranted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpeechToTextInitialState value)? initial,
    TResult Function(SpeechToTextListeningState value)? listening,
    TResult Function(SpeechToTextStoppedState value)? stopped,
    TResult Function(SpeechToTextErrorState value)? error,
    TResult Function(SpeechToTextPermissionDeniedState value)? permissionDenied,
    TResult Function(SpeechToTextPermissionGrantedState value)?
        permissionGranted,
    required TResult orElse(),
  }) {
    if (permissionGranted != null) {
      return permissionGranted(this);
    }
    return orElse();
  }
}

abstract class SpeechToTextPermissionGrantedState implements SpeechToTextState {
  const factory SpeechToTextPermissionGrantedState() =
      _$SpeechToTextPermissionGrantedStateImpl;
}
