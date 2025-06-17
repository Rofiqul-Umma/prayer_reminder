// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expanses_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpansesModel _$ExpansesModelFromJson(Map<String, dynamic> json) {
  return _ExpansesModel.fromJson(json);
}

/// @nodoc
mixin _$ExpansesModel {
  String get id => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  /// Serializes this ExpansesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpansesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpansesModelCopyWith<ExpansesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpansesModelCopyWith<$Res> {
  factory $ExpansesModelCopyWith(
          ExpansesModel value, $Res Function(ExpansesModel) then) =
      _$ExpansesModelCopyWithImpl<$Res, ExpansesModel>;
  @useResult
  $Res call(
      {String id,
      String category,
      String description,
      int amount,
      DateTime date});
}

/// @nodoc
class _$ExpansesModelCopyWithImpl<$Res, $Val extends ExpansesModel>
    implements $ExpansesModelCopyWith<$Res> {
  _$ExpansesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpansesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? description = null,
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpansesModelImplCopyWith<$Res>
    implements $ExpansesModelCopyWith<$Res> {
  factory _$$ExpansesModelImplCopyWith(
          _$ExpansesModelImpl value, $Res Function(_$ExpansesModelImpl) then) =
      __$$ExpansesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String category,
      String description,
      int amount,
      DateTime date});
}

/// @nodoc
class __$$ExpansesModelImplCopyWithImpl<$Res>
    extends _$ExpansesModelCopyWithImpl<$Res, _$ExpansesModelImpl>
    implements _$$ExpansesModelImplCopyWith<$Res> {
  __$$ExpansesModelImplCopyWithImpl(
      _$ExpansesModelImpl _value, $Res Function(_$ExpansesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpansesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? category = null,
    Object? description = null,
    Object? amount = null,
    Object? date = null,
  }) {
    return _then(_$ExpansesModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpansesModelImpl implements _ExpansesModel {
  const _$ExpansesModelImpl(
      {required this.id,
      required this.category,
      required this.description,
      required this.amount,
      required this.date});

  factory _$ExpansesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpansesModelImplFromJson(json);

  @override
  final String id;
  @override
  final String category;
  @override
  final String description;
  @override
  final int amount;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'ExpansesModel(id: $id, category: $category, description: $description, amount: $amount, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpansesModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, category, description, amount, date);

  /// Create a copy of ExpansesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpansesModelImplCopyWith<_$ExpansesModelImpl> get copyWith =>
      __$$ExpansesModelImplCopyWithImpl<_$ExpansesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpansesModelImplToJson(
      this,
    );
  }
}

abstract class _ExpansesModel implements ExpansesModel {
  const factory _ExpansesModel(
      {required final String id,
      required final String category,
      required final String description,
      required final int amount,
      required final DateTime date}) = _$ExpansesModelImpl;

  factory _ExpansesModel.fromJson(Map<String, dynamic> json) =
      _$ExpansesModelImpl.fromJson;

  @override
  String get id;
  @override
  String get category;
  @override
  String get description;
  @override
  int get amount;
  @override
  DateTime get date;

  /// Create a copy of ExpansesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpansesModelImplCopyWith<_$ExpansesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
