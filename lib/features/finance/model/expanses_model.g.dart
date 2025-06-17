// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expanses_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpansesModelImpl _$$ExpansesModelImplFromJson(Map<String, dynamic> json) =>
    _$ExpansesModelImpl(
      id: json['id'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      amount: (json['amount'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$ExpansesModelImplToJson(_$ExpansesModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'description': instance.description,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
    };
