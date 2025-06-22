import 'package:freezed_annotation/freezed_annotation.dart';
part 'flashlight_state.freezed.dart';

@freezed
class FlashlightState with _$FlashlightState {
  const factory FlashlightState.initial() = FlashlightInitialState;

  const factory FlashlightState.on() = FlashlightOnState;

  const factory FlashlightState.off() = FlashlightOffState;

  const factory FlashlightState.error(String message) = FlashlightErrorState;
}
