import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextService {
  final _speechToText = stt.SpeechToText();

  Future<void> initialize() async {
    await _speechToText.initialize(
      onStatus: (status) async {
        debugPrint('SpeechToText status: $status');
      },
      onError: (error) {
        debugPrint('SpeechToText error: $error');
      },
    );
  }

  Future<bool> checkPermissions() async {
    final status = await Permission.microphone.request();
    return status.isGranted;
  }

  Future<void> startListening({
    required Function(String command) onResultCommand,
  }) async {
    await _speechToText.listen(
      onResult: (result) {
        onResultCommand(result.recognizedWords.toLowerCase());
      },
      onSoundLevelChange: (level) {
        debugPrint('Sound level: $level');
      },
      listenFor: Duration(seconds: 60), // Set the duration for listening
    );
  }

  Future<void> stopListening() async {
    await _speechToText.stop();
  }
}
