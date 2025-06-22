import 'package:freezed_annotation/freezed_annotation.dart';
part 'stopwatch_state.freezed.dart';

@freezed
class StopWatchState with _$StopWatchState {
  const factory StopWatchState.initial() = StopWatchInitialState;

  const factory StopWatchState.running(Duration elapsed) =
      StopWatchRunningState;

  const factory StopWatchState.paused(Duration elapsed) = StopWatchPausedState;

  const factory StopWatchState.stopped() = StopWatchStoppedState;

  const factory StopWatchState.error(String message) = StopWatchErrorState;
}
