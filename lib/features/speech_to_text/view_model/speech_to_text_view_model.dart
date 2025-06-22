import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:prayer_reminder/features/speech_to_text/service/speech_to_text_service.dart';
import 'package:prayer_reminder/features/speech_to_text/view_model/speech_to_text_state.dart';

class SpeechToTextViewModel extends Cubit<SpeechToTextState> {
  final SpeechToTextService _service;
  SpeechToTextViewModel(this._service)
    : super(const SpeechToTextState.initial()) {
    init();
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    debugPrint('SpeechToTextViewModel error: $error');
  }

  @override
  void onChange(Change<SpeechToTextState> change) {
    super.onChange(change);
    debugPrint('SpeechToTextViewModel state changed: ${change.currentState}');
  }

  Future<void> init() async {
    await _service.initialize();
  }

  Future<void> startListening() async {
    try {
      if (await _service.checkPermissions() == false) {
        throw Exception('Microphone permission not granted');
      }
      await _service.startListening(
        onResultCommand: (command) {
          emit(SpeechToTextState.listening(command));
        },
      );
    } catch (e) {
      emit(SpeechToTextState.error('Failed to start listening: $e'));
    }
  }

  Future<void> stopListening() async {
    try {
      _service.stopListening();
      emit(const SpeechToTextState.stopped());
    } catch (e) {
      emit(SpeechToTextState.error('Failed to stop listening: $e'));
    }
  }
}
