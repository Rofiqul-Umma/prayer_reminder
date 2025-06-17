import 'package:freezed_annotation/freezed_annotation.dart';
part 'expanses_model.freezed.dart';
part 'expanses_model.g.dart';

@freezed
class ExpansesModel with _$ExpansesModel {
  const factory ExpansesModel({
    required String id,
    required String category,
    required String description,
    required int amount,
    required DateTime date,
  }) = _ExpansesModel;

  factory ExpansesModel.fromJson(Map<String, dynamic> json) =>
      _$ExpansesModelFromJson(json);
}
