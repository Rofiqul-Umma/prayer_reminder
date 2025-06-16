import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prayer_reminder/features/get_hadits/model/get_hadits_model.dart';
part 'get_hadits_state.freezed.dart';

@freezed
class GetHaditsState with _$GetHaditsState {
  const factory GetHaditsState.initial() = GetHaditsInitialState;
  const factory GetHaditsState.loading() = GetHaditsLoadingState;
  const factory GetHaditsState.success(List<Hadith> hadits) =
      GetHaditsSuccessState;
  const factory GetHaditsState.error(String error) = GetHaditsErrorState;
}
