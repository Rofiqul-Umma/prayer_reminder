import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:prayer_reminder/features/stopwatch/view_model/stopwatch_state.dart';

class StopwatchViewModel extends Cubit<StopWatchState> {
  StopwatchViewModel() : super(StopWatchState.initial());

  Timer? _timer;
  Duration _elapsed = Duration.zero;

  bool get isRunning => state is StopWatchRunningState;
  bool get isPaused => state is StopWatchPausedState;
  bool get isStopped => state is StopWatchStoppedState;
  bool get isInitial => state is StopWatchInitialState;

  void start() {
    if (isRunning) return;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _elapsed += const Duration(seconds: 1);
      emit(StopWatchState.running(_elapsed));
    });
    emit(StopWatchState.running(_elapsed));
  }

  void pause() {
    if (!isRunning) return;
    _timer?.cancel();
    emit(StopWatchState.paused(_elapsed));
  }

  void stop() {
    if (!isRunning && !isPaused) return;
    _timer?.cancel();
    emit(const StopWatchState.stopped());
  }

  void reset() {
    _timer?.cancel();
    _elapsed = Duration.zero;
    emit(const StopWatchState.initial());
  }

  void error(String message) {
    _timer?.cancel();
    emit(StopWatchState.error(message));
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  @override
  void onChange(Change<StopWatchState> change) {
    super.onChange(change);
    // Optionally, you can log state changes here
    debugPrint('StopwatchViewModel state changed: ${change.currentState}');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    // Optionally, you can log errors here
    debugPrint('StopwatchViewModel error: $error');
  }
}
