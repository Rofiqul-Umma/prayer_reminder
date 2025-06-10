import 'package:equatable/equatable.dart';
import 'package:prayer_reminder/features/get_hadits/model/get_hadits_model.dart';

sealed class GetHaditsState extends Equatable {
  const GetHaditsState();

  @override
  List<Object?> get props => [];
}

class GetHaditsInitialState extends GetHaditsState {}

class GetHaditsLoadingState extends GetHaditsState {}

class GetHaditsSuccessState extends GetHaditsState {
  final List<Hadith> hadits;
  const GetHaditsSuccessState(this.hadits);

  @override
  List<Object?> get props => [hadits];
}

class GetHaditsErrorState extends GetHaditsState {
  final String error;
  const GetHaditsErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
