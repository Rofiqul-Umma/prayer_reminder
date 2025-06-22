import 'package:bloc/bloc.dart';
import 'package:prayer_reminder/features/flaslight/service/flashlight_service.dart';
import 'package:prayer_reminder/features/flaslight/view_model/flashlight_state.dart';

class FlashlightViewModel extends Cubit<FlashlightState> {
  final FlashlightService _service;
  FlashlightViewModel(this._service) : super(const FlashlightState.initial());

  @override
  void onChange(Change<FlashlightState> change) {
    super.onChange(change);
    print('FlashlightViewModel state changed: ${change.currentState}');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('FlashlightViewModel error: $error');
  }

  Future<void> turnOn() async {
    try {
      await _service.turnOn();
      emit(const FlashlightState.on());
    } catch (e) {
      emit(FlashlightState.error('Failed to turn on flashlight: $e'));
    }
  }

  Future<void> turnOff() async {
    try {
      await _service.turnOff();
      emit(const FlashlightState.off());
    } catch (e) {
      emit(FlashlightState.error('Failed to turn off flashlight: $e'));
    }
  }
}
