// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_hadits_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetHaditsModelImpl _$$GetHaditsModelImplFromJson(Map<String, dynamic> json) =>
    _$GetHaditsModelImpl(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
      data: DataHadits.fromJson(json['data'] as Map<String, dynamic>),
      error: json['error'] as bool,
    );

Map<String, dynamic> _$$GetHaditsModelImplToJson(
        _$GetHaditsModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
      'error': instance.error,
    };

_$DataHaditsImpl _$$DataHaditsImplFromJson(Map<String, dynamic> json) =>
    _$DataHaditsImpl(
      name: json['name'] as String,
      id: json['id'] as String,
      available: (json['available'] as num).toInt(),
      requested: (json['requested'] as num).toInt(),
      hadiths: (json['hadiths'] as List<dynamic>)
          .map((e) => Hadith.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DataHaditsImplToJson(_$DataHaditsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'available': instance.available,
      'requested': instance.requested,
      'hadiths': instance.hadiths,
    };

_$HadithImpl _$$HadithImplFromJson(Map<String, dynamic> json) => _$HadithImpl(
      number: (json['number'] as num).toInt(),
      arab: json['arab'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$$HadithImplToJson(_$HadithImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'arab': instance.arab,
      'id': instance.id,
    };
