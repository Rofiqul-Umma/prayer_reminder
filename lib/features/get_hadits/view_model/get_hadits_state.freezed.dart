// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_hadits_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetHaditsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Hadith> hadits) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Hadith> hadits)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Hadith> hadits)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHaditsInitialState value) initial,
    required TResult Function(GetHaditsLoadingState value) loading,
    required TResult Function(GetHaditsSuccessState value) success,
    required TResult Function(GetHaditsErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHaditsInitialState value)? initial,
    TResult? Function(GetHaditsLoadingState value)? loading,
    TResult? Function(GetHaditsSuccessState value)? success,
    TResult? Function(GetHaditsErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHaditsInitialState value)? initial,
    TResult Function(GetHaditsLoadingState value)? loading,
    TResult Function(GetHaditsSuccessState value)? success,
    TResult Function(GetHaditsErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetHaditsStateCopyWith<$Res> {
  factory $GetHaditsStateCopyWith(
          GetHaditsState value, $Res Function(GetHaditsState) then) =
      _$GetHaditsStateCopyWithImpl<$Res, GetHaditsState>;
}

/// @nodoc
class _$GetHaditsStateCopyWithImpl<$Res, $Val extends GetHaditsState>
    implements $GetHaditsStateCopyWith<$Res> {
  _$GetHaditsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetHaditsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetHaditsInitialStateImplCopyWith<$Res> {
  factory _$$GetHaditsInitialStateImplCopyWith(
          _$GetHaditsInitialStateImpl value,
          $Res Function(_$GetHaditsInitialStateImpl) then) =
      __$$GetHaditsInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetHaditsInitialStateImplCopyWithImpl<$Res>
    extends _$GetHaditsStateCopyWithImpl<$Res, _$GetHaditsInitialStateImpl>
    implements _$$GetHaditsInitialStateImplCopyWith<$Res> {
  __$$GetHaditsInitialStateImplCopyWithImpl(_$GetHaditsInitialStateImpl _value,
      $Res Function(_$GetHaditsInitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetHaditsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetHaditsInitialStateImpl implements GetHaditsInitialState {
  const _$GetHaditsInitialStateImpl();

  @override
  String toString() {
    return 'GetHaditsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetHaditsInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Hadith> hadits) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Hadith> hadits)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Hadith> hadits)? success,
    TResult Function(String error)? error,
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
    required TResult Function(GetHaditsInitialState value) initial,
    required TResult Function(GetHaditsLoadingState value) loading,
    required TResult Function(GetHaditsSuccessState value) success,
    required TResult Function(GetHaditsErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHaditsInitialState value)? initial,
    TResult? Function(GetHaditsLoadingState value)? loading,
    TResult? Function(GetHaditsSuccessState value)? success,
    TResult? Function(GetHaditsErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHaditsInitialState value)? initial,
    TResult Function(GetHaditsLoadingState value)? loading,
    TResult Function(GetHaditsSuccessState value)? success,
    TResult Function(GetHaditsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class GetHaditsInitialState implements GetHaditsState {
  const factory GetHaditsInitialState() = _$GetHaditsInitialStateImpl;
}

/// @nodoc
abstract class _$$GetHaditsLoadingStateImplCopyWith<$Res> {
  factory _$$GetHaditsLoadingStateImplCopyWith(
          _$GetHaditsLoadingStateImpl value,
          $Res Function(_$GetHaditsLoadingStateImpl) then) =
      __$$GetHaditsLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetHaditsLoadingStateImplCopyWithImpl<$Res>
    extends _$GetHaditsStateCopyWithImpl<$Res, _$GetHaditsLoadingStateImpl>
    implements _$$GetHaditsLoadingStateImplCopyWith<$Res> {
  __$$GetHaditsLoadingStateImplCopyWithImpl(_$GetHaditsLoadingStateImpl _value,
      $Res Function(_$GetHaditsLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetHaditsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetHaditsLoadingStateImpl implements GetHaditsLoadingState {
  const _$GetHaditsLoadingStateImpl();

  @override
  String toString() {
    return 'GetHaditsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetHaditsLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Hadith> hadits) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Hadith> hadits)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Hadith> hadits)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHaditsInitialState value) initial,
    required TResult Function(GetHaditsLoadingState value) loading,
    required TResult Function(GetHaditsSuccessState value) success,
    required TResult Function(GetHaditsErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHaditsInitialState value)? initial,
    TResult? Function(GetHaditsLoadingState value)? loading,
    TResult? Function(GetHaditsSuccessState value)? success,
    TResult? Function(GetHaditsErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHaditsInitialState value)? initial,
    TResult Function(GetHaditsLoadingState value)? loading,
    TResult Function(GetHaditsSuccessState value)? success,
    TResult Function(GetHaditsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GetHaditsLoadingState implements GetHaditsState {
  const factory GetHaditsLoadingState() = _$GetHaditsLoadingStateImpl;
}

/// @nodoc
abstract class _$$GetHaditsSuccessStateImplCopyWith<$Res> {
  factory _$$GetHaditsSuccessStateImplCopyWith(
          _$GetHaditsSuccessStateImpl value,
          $Res Function(_$GetHaditsSuccessStateImpl) then) =
      __$$GetHaditsSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Hadith> hadits});
}

/// @nodoc
class __$$GetHaditsSuccessStateImplCopyWithImpl<$Res>
    extends _$GetHaditsStateCopyWithImpl<$Res, _$GetHaditsSuccessStateImpl>
    implements _$$GetHaditsSuccessStateImplCopyWith<$Res> {
  __$$GetHaditsSuccessStateImplCopyWithImpl(_$GetHaditsSuccessStateImpl _value,
      $Res Function(_$GetHaditsSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetHaditsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hadits = null,
  }) {
    return _then(_$GetHaditsSuccessStateImpl(
      null == hadits
          ? _value._hadits
          : hadits // ignore: cast_nullable_to_non_nullable
              as List<Hadith>,
    ));
  }
}

/// @nodoc

class _$GetHaditsSuccessStateImpl implements GetHaditsSuccessState {
  const _$GetHaditsSuccessStateImpl(final List<Hadith> hadits)
      : _hadits = hadits;

  final List<Hadith> _hadits;
  @override
  List<Hadith> get hadits {
    if (_hadits is EqualUnmodifiableListView) return _hadits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hadits);
  }

  @override
  String toString() {
    return 'GetHaditsState.success(hadits: $hadits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetHaditsSuccessStateImpl &&
            const DeepCollectionEquality().equals(other._hadits, _hadits));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_hadits));

  /// Create a copy of GetHaditsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetHaditsSuccessStateImplCopyWith<_$GetHaditsSuccessStateImpl>
      get copyWith => __$$GetHaditsSuccessStateImplCopyWithImpl<
          _$GetHaditsSuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Hadith> hadits) success,
    required TResult Function(String error) error,
  }) {
    return success(hadits);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Hadith> hadits)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(hadits);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Hadith> hadits)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(hadits);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHaditsInitialState value) initial,
    required TResult Function(GetHaditsLoadingState value) loading,
    required TResult Function(GetHaditsSuccessState value) success,
    required TResult Function(GetHaditsErrorState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHaditsInitialState value)? initial,
    TResult? Function(GetHaditsLoadingState value)? loading,
    TResult? Function(GetHaditsSuccessState value)? success,
    TResult? Function(GetHaditsErrorState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHaditsInitialState value)? initial,
    TResult Function(GetHaditsLoadingState value)? loading,
    TResult Function(GetHaditsSuccessState value)? success,
    TResult Function(GetHaditsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetHaditsSuccessState implements GetHaditsState {
  const factory GetHaditsSuccessState(final List<Hadith> hadits) =
      _$GetHaditsSuccessStateImpl;

  List<Hadith> get hadits;

  /// Create a copy of GetHaditsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetHaditsSuccessStateImplCopyWith<_$GetHaditsSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetHaditsErrorStateImplCopyWith<$Res> {
  factory _$$GetHaditsErrorStateImplCopyWith(_$GetHaditsErrorStateImpl value,
          $Res Function(_$GetHaditsErrorStateImpl) then) =
      __$$GetHaditsErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$GetHaditsErrorStateImplCopyWithImpl<$Res>
    extends _$GetHaditsStateCopyWithImpl<$Res, _$GetHaditsErrorStateImpl>
    implements _$$GetHaditsErrorStateImplCopyWith<$Res> {
  __$$GetHaditsErrorStateImplCopyWithImpl(_$GetHaditsErrorStateImpl _value,
      $Res Function(_$GetHaditsErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetHaditsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GetHaditsErrorStateImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetHaditsErrorStateImpl implements GetHaditsErrorState {
  const _$GetHaditsErrorStateImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'GetHaditsState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetHaditsErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of GetHaditsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetHaditsErrorStateImplCopyWith<_$GetHaditsErrorStateImpl> get copyWith =>
      __$$GetHaditsErrorStateImplCopyWithImpl<_$GetHaditsErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Hadith> hadits) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Hadith> hadits)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Hadith> hadits)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHaditsInitialState value) initial,
    required TResult Function(GetHaditsLoadingState value) loading,
    required TResult Function(GetHaditsSuccessState value) success,
    required TResult Function(GetHaditsErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHaditsInitialState value)? initial,
    TResult? Function(GetHaditsLoadingState value)? loading,
    TResult? Function(GetHaditsSuccessState value)? success,
    TResult? Function(GetHaditsErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHaditsInitialState value)? initial,
    TResult Function(GetHaditsLoadingState value)? loading,
    TResult Function(GetHaditsSuccessState value)? success,
    TResult Function(GetHaditsErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GetHaditsErrorState implements GetHaditsState {
  const factory GetHaditsErrorState(final String error) =
      _$GetHaditsErrorStateImpl;

  String get error;

  /// Create a copy of GetHaditsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetHaditsErrorStateImplCopyWith<_$GetHaditsErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
