import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_hadits_model.freezed.dart';
part 'get_hadits_model.g.dart';

@freezed
class GetHaditsModel with _$GetHaditsModel {
  const factory GetHaditsModel({
    required int code,
    required String message,
    required DataHadits data,
    required bool error,
  }) = _GetHaditsModel;

  factory GetHaditsModel.fromJson(Map<String, dynamic> json) =>
      _$GetHaditsModelFromJson(json);
}

@freezed
class DataHadits with _$DataHadits {
  const factory DataHadits({
    required String name,
    required String id,
    required int available,
    required int requested,
    required List<Hadith> hadiths,
  }) = _DataHadits;

  factory DataHadits.fromJson(Map<String, dynamic> json) =>
      _$DataHaditsFromJson(json);
}

@freezed
class Hadith with _$Hadith {
  const factory Hadith({
    required int number,
    required String arab,
    required String id,
  }) = _Hadith;

  factory Hadith.fromJson(Map<String, dynamic> json) => _$HadithFromJson(json);
}
