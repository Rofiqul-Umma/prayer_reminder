// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stopwatch_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StopWatchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Duration elapsed) running,
    required TResult Function(Duration elapsed) paused,
    required TResult Function() stopped,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Duration elapsed)? running,
    TResult? Function(Duration elapsed)? paused,
    TResult? Function()? stopped,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Duration elapsed)? running,
    TResult Function(Duration elapsed)? paused,
    TResult Function()? stopped,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StopWatchInitialState value) initial,
    required TResult Function(StopWatchRunningState value) running,
    required TResult Function(StopWatchPausedState value) paused,
    required TResult Function(StopWatchStoppedState value) stopped,
    required TResult Function(StopWatchErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StopWatchInitialState value)? initial,
    TResult? Function(StopWatchRunningState value)? running,
    TResult? Function(StopWatchPausedState value)? paused,
    TResult? Function(StopWatchStoppedState value)? stopped,
    TResult? Function(StopWatchErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StopWatchInitialState value)? initial,
    TResult Function(StopWatchRunningState value)? running,
    TResult Function(StopWatchPausedState value)? paused,
    TResult Function(StopWatchStoppedState value)? stopped,
    TResult Function(StopWatchErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StopWatchStateCopyWith<$Res> {
  factory $StopWatchStateCopyWith(
          StopWatchState value, $Res Function(StopWatchState) then) =
      _$StopWatchStateCopyWithImpl<$Res, StopWatchState>;
}

/// @nodoc
class _$StopWatchStateCopyWithImpl<$Res, $Val extends StopWatchState>
    implements $StopWatchStateCopyWith<$Res> {
  _$StopWatchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StopWatchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StopWatchInitialStateImplCopyWith<$Res> {
  factory _$$StopWatchInitialStateImplCopyWith(
          _$StopWatchInitialStateImpl value,
          $Res Function(_$StopWatchInitialStateImpl) then) =
      __$$StopWatchInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StopWatchInitialStateImplCopyWithImpl<$Res>
    extends _$StopWatchStateCopyWithImpl<$Res, _$StopWatchInitialStateImpl>
    implements _$$StopWatchInitialStateImplCopyWith<$Res> {
  __$$StopWatchInitialStateImplCopyWithImpl(_$StopWatchInitialStateImpl _value,
      $Res Function(_$StopWatchInitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StopWatchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StopWatchInitialStateImpl implements StopWatchInitialState {
  const _$StopWatchInitialStateImpl();

  @override
  String toString() {
    return 'StopWatchState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StopWatchInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Duration elapsed) running,
    required TResult Function(Duration elapsed) paused,
    required TResult Function() stopped,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Duration elapsed)? running,
    TResult? Function(Duration elapsed)? paused,
    TResult? Function()? stopped,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Duration elapsed)? running,
    TResult Function(Duration elapsed)? paused,
    TResult Function()? stopped,
    TResult Function(String message)? error,
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
    required TResult Function(StopWatchInitialState value) initial,
    required TResult Function(StopWatchRunningState value) running,
    required TResult Function(StopWatchPausedState value) paused,
    required TResult Function(StopWatchStoppedState value) stopped,
    required TResult Function(StopWatchErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StopWatchInitialState value)? initial,
    TResult? Function(StopWatchRunningState value)? running,
    TResult? Function(StopWatchPausedState value)? paused,
    TResult? Function(StopWatchStoppedState value)? stopped,
    TResult? Function(StopWatchErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StopWatchInitialState value)? initial,
    TResult Function(StopWatchRunningState value)? running,
    TResult Function(StopWatchPausedState value)? paused,
    TResult Function(StopWatchStoppedState value)? stopped,
    TResult Function(StopWatchErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class StopWatchInitialState implements StopWatchState {
  const factory StopWatchInitialState() = _$StopWatchInitialStateImpl;
}

/// @nodoc
abstract class _$$StopWatchRunningStateImplCopyWith<$Res> {
  factory _$$StopWatchRunningStateImplCopyWith(
          _$StopWatchRunningStateImpl value,
          $Res Function(_$StopWatchRunningStateImpl) then) =
      __$$StopWatchRunningStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration elapsed});
}

/// @nodoc
class __$$StopWatchRunningStateImplCopyWithImpl<$Res>
    extends _$StopWatchStateCopyWithImpl<$Res, _$StopWatchRunningStateImpl>
    implements _$$StopWatchRunningStateImplCopyWith<$Res> {
  __$$StopWatchRunningStateImplCopyWithImpl(_$StopWatchRunningStateImpl _value,
      $Res Function(_$StopWatchRunningStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StopWatchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elapsed = null,
  }) {
    return _then(_$StopWatchRunningStateImpl(
      null == elapsed
          ? _value.elapsed
          : elapsed // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$StopWatchRunningStateImpl implements StopWatchRunningState {
  const _$StopWatchRunningStateImpl(this.elapsed);

  @override
  final Duration elapsed;

  @override
  String toString() {
    return 'StopWatchState.running(elapsed: $elapsed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StopWatchRunningStateImpl &&
            (identical(other.elapsed, elapsed) || other.elapsed == elapsed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, elapsed);

  /// Create a copy of StopWatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StopWatchRunningStateImplCopyWith<_$StopWatchRunningStateImpl>
      get copyWith => __$$StopWatchRunningStateImplCopyWithImpl<
          _$StopWatchRunningStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Duration elapsed) running,
    required TResult Function(Duration elapsed) paused,
    required TResult Function() stopped,
    required TResult Function(String message) error,
  }) {
    return running(elapsed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Duration elapsed)? running,
    TResult? Function(Duration elapsed)? paused,
    TResult? Function()? stopped,
    TResult? Function(String message)? error,
  }) {
    return running?.call(elapsed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Duration elapsed)? running,
    TResult Function(Duration elapsed)? paused,
    TResult Function()? stopped,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(elapsed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StopWatchInitialState value) initial,
    required TResult Function(StopWatchRunningState value) running,
    required TResult Function(StopWatchPausedState value) paused,
    required TResult Function(StopWatchStoppedState value) stopped,
    required TResult Function(StopWatchErrorState value) error,
  }) {
    return running(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StopWatchInitialState value)? initial,
    TResult? Function(StopWatchRunningState value)? running,
    TResult? Function(StopWatchPausedState value)? paused,
    TResult? Function(StopWatchStoppedState value)? stopped,
    TResult? Function(StopWatchErrorState value)? error,
  }) {
    return running?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StopWatchInitialState value)? initial,
    TResult Function(StopWatchRunningState value)? running,
    TResult Function(StopWatchPausedState value)? paused,
    TResult Function(StopWatchStoppedState value)? stopped,
    TResult Function(StopWatchErrorState value)? error,
    required TResult orElse(),
  }) {
    if (running != null) {
      return running(this);
    }
    return orElse();
  }
}

abstract class StopWatchRunningState implements StopWatchState {
  const factory StopWatchRunningState(final Duration elapsed) =
      _$StopWatchRunningStateImpl;

  Duration get elapsed;

  /// Create a copy of StopWatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StopWatchRunningStateImplCopyWith<_$StopWatchRunningStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StopWatchPausedStateImplCopyWith<$Res> {
  factory _$$StopWatchPausedStateImplCopyWith(_$StopWatchPausedStateImpl value,
          $Res Function(_$StopWatchPausedStateImpl) then) =
      __$$StopWatchPausedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration elapsed});
}

/// @nodoc
class __$$StopWatchPausedStateImplCopyWithImpl<$Res>
    extends _$StopWatchStateCopyWithImpl<$Res, _$StopWatchPausedStateImpl>
    implements _$$StopWatchPausedStateImplCopyWith<$Res> {
  __$$StopWatchPausedStateImplCopyWithImpl(_$StopWatchPausedStateImpl _value,
      $Res Function(_$StopWatchPausedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StopWatchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elapsed = null,
  }) {
    return _then(_$StopWatchPausedStateImpl(
      null == elapsed
          ? _value.elapsed
          : elapsed // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$StopWatchPausedStateImpl implements StopWatchPausedState {
  const _$StopWatchPausedStateImpl(this.elapsed);

  @override
  final Duration elapsed;

  @override
  String toString() {
    return 'StopWatchState.paused(elapsed: $elapsed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StopWatchPausedStateImpl &&
            (identical(other.elapsed, elapsed) || other.elapsed == elapsed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, elapsed);

  /// Create a copy of StopWatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StopWatchPausedStateImplCopyWith<_$StopWatchPausedStateImpl>
      get copyWith =>
          __$$StopWatchPausedStateImplCopyWithImpl<_$StopWatchPausedStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Duration elapsed) running,
    required TResult Function(Duration elapsed) paused,
    required TResult Function() stopped,
    required TResult Function(String message) error,
  }) {
    return paused(elapsed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Duration elapsed)? running,
    TResult? Function(Duration elapsed)? paused,
    TResult? Function()? stopped,
    TResult? Function(String message)? error,
  }) {
    return paused?.call(elapsed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Duration elapsed)? running,
    TResult Function(Duration elapsed)? paused,
    TResult Function()? stopped,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(elapsed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StopWatchInitialState value) initial,
    required TResult Function(StopWatchRunningState value) running,
    required TResult Function(StopWatchPausedState value) paused,
    required TResult Function(StopWatchStoppedState value) stopped,
    required TResult Function(StopWatchErrorState value) error,
  }) {
    return paused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StopWatchInitialState value)? initial,
    TResult? Function(StopWatchRunningState value)? running,
    TResult? Function(StopWatchPausedState value)? paused,
    TResult? Function(StopWatchStoppedState value)? stopped,
    TResult? Function(StopWatchErrorState value)? error,
  }) {
    return paused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StopWatchInitialState value)? initial,
    TResult Function(StopWatchRunningState value)? running,
    TResult Function(StopWatchPausedState value)? paused,
    TResult Function(StopWatchStoppedState value)? stopped,
    TResult Function(StopWatchErrorState value)? error,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }
}

abstract class StopWatchPausedState implements StopWatchState {
  const factory StopWatchPausedState(final Duration elapsed) =
      _$StopWatchPausedStateImpl;

  Duration get elapsed;

  /// Create a copy of StopWatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StopWatchPausedStateImplCopyWith<_$StopWatchPausedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StopWatchStoppedStateImplCopyWith<$Res> {
  factory _$$StopWatchStoppedStateImplCopyWith(
          _$StopWatchStoppedStateImpl value,
          $Res Function(_$StopWatchStoppedStateImpl) then) =
      __$$StopWatchStoppedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StopWatchStoppedStateImplCopyWithImpl<$Res>
    extends _$StopWatchStateCopyWithImpl<$Res, _$StopWatchStoppedStateImpl>
    implements _$$StopWatchStoppedStateImplCopyWith<$Res> {
  __$$StopWatchStoppedStateImplCopyWithImpl(_$StopWatchStoppedStateImpl _value,
      $Res Function(_$StopWatchStoppedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StopWatchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StopWatchStoppedStateImpl implements StopWatchStoppedState {
  const _$StopWatchStoppedStateImpl();

  @override
  String toString() {
    return 'StopWatchState.stopped()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StopWatchStoppedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Duration elapsed) running,
    required TResult Function(Duration elapsed) paused,
    required TResult Function() stopped,
    required TResult Function(String message) error,
  }) {
    return stopped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Duration elapsed)? running,
    TResult? Function(Duration elapsed)? paused,
    TResult? Function()? stopped,
    TResult? Function(String message)? error,
  }) {
    return stopped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Duration elapsed)? running,
    TResult Function(Duration elapsed)? paused,
    TResult Function()? stopped,
    TResult Function(String message)? error,
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
    required TResult Function(StopWatchInitialState value) initial,
    required TResult Function(StopWatchRunningState value) running,
    required TResult Function(StopWatchPausedState value) paused,
    required TResult Function(StopWatchStoppedState value) stopped,
    required TResult Function(StopWatchErrorState value) error,
  }) {
    return stopped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StopWatchInitialState value)? initial,
    TResult? Function(StopWatchRunningState value)? running,
    TResult? Function(StopWatchPausedState value)? paused,
    TResult? Function(StopWatchStoppedState value)? stopped,
    TResult? Function(StopWatchErrorState value)? error,
  }) {
    return stopped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StopWatchInitialState value)? initial,
    TResult Function(StopWatchRunningState value)? running,
    TResult Function(StopWatchPausedState value)? paused,
    TResult Function(StopWatchStoppedState value)? stopped,
    TResult Function(StopWatchErrorState value)? error,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped(this);
    }
    return orElse();
  }
}

abstract class StopWatchStoppedState implements StopWatchState {
  const factory StopWatchStoppedState() = _$StopWatchStoppedStateImpl;
}

/// @nodoc
abstract class _$$StopWatchErrorStateImplCopyWith<$Res> {
  factory _$$StopWatchErrorStateImplCopyWith(_$StopWatchErrorStateImpl value,
          $Res Function(_$StopWatchErrorStateImpl) then) =
      __$$StopWatchErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$StopWatchErrorStateImplCopyWithImpl<$Res>
    extends _$StopWatchStateCopyWithImpl<$Res, _$StopWatchErrorStateImpl>
    implements _$$StopWatchErrorStateImplCopyWith<$Res> {
  __$$StopWatchErrorStateImplCopyWithImpl(_$StopWatchErrorStateImpl _value,
      $Res Function(_$StopWatchErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StopWatchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$StopWatchErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StopWatchErrorStateImpl implements StopWatchErrorState {
  const _$StopWatchErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'StopWatchState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StopWatchErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of StopWatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StopWatchErrorStateImplCopyWith<_$StopWatchErrorStateImpl> get copyWith =>
      __$$StopWatchErrorStateImplCopyWithImpl<_$StopWatchErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(Duration elapsed) running,
    required TResult Function(Duration elapsed) paused,
    required TResult Function() stopped,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(Duration elapsed)? running,
    TResult? Function(Duration elapsed)? paused,
    TResult? Function()? stopped,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(Duration elapsed)? running,
    TResult Function(Duration elapsed)? paused,
    TResult Function()? stopped,
    TResult Function(String message)? error,
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
    required TResult Function(StopWatchInitialState value) initial,
    required TResult Function(StopWatchRunningState value) running,
    required TResult Function(StopWatchPausedState value) paused,
    required TResult Function(StopWatchStoppedState value) stopped,
    required TResult Function(StopWatchErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StopWatchInitialState value)? initial,
    TResult? Function(StopWatchRunningState value)? running,
    TResult? Function(StopWatchPausedState value)? paused,
    TResult? Function(StopWatchStoppedState value)? stopped,
    TResult? Function(StopWatchErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StopWatchInitialState value)? initial,
    TResult Function(StopWatchRunningState value)? running,
    TResult Function(StopWatchPausedState value)? paused,
    TResult Function(StopWatchStoppedState value)? stopped,
    TResult Function(StopWatchErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class StopWatchErrorState implements StopWatchState {
  const factory StopWatchErrorState(final String message) =
      _$StopWatchErrorStateImpl;

  String get message;

  /// Create a copy of StopWatchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StopWatchErrorStateImplCopyWith<_$StopWatchErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
