import 'package:prayer_reminder/features/get_current_loc/model/location_model.dart';

sealed class GetCurrentLocationState {}

class GetCurrentLocationInitialState extends GetCurrentLocationState {}

class GetCurrentLocationLoadingState extends GetCurrentLocationState {}

class GetCurrentLocationSuccessState extends GetCurrentLocationState {
  final LocationModel data;
  GetCurrentLocationSuccessState(this.data);
}

class GetCurrentLocationErrorState extends GetCurrentLocationState {
  final String error;
  GetCurrentLocationErrorState(this.error);
}
