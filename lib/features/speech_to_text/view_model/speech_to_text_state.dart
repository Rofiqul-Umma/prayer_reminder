import 'package:freezed_annotation/freezed_annotation.dart';
part 'speech_to_text_state.freezed.dart';

@freezed
class SpeechToTextState with _$SpeechToTextState {
  // initial state
  const factory SpeechToTextState.initial() = SpeechToTextInitialState;
  // listening state
  const factory SpeechToTextState.listening(String recognizedText) =
      SpeechToTextListeningState;
  // stopped state
  const factory SpeechToTextState.stopped() = SpeechToTextStoppedState;
  // error state
  const factory SpeechToTextState.error(String message) =
      SpeechToTextErrorState;
  // permission denied state
  const factory SpeechToTextState.permissionDenied() =
      SpeechToTextPermissionDeniedState;
  // permission granted state
  const factory SpeechToTextState.permissionGranted() =
      SpeechToTextPermissionGrantedState;
}
