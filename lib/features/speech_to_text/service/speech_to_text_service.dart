import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechToTextService {
  final _speechToText = stt.SpeechToText();

  Future<void> initialize() async {
    await _speechToText.initialize(
      onStatus: (status) {
        // Handle status updates, e.g., print or update state
        print('Speech recognition status: $status');
      },
      onError: (error) {
        // Handle errors, e.g., print or update state
        print('Speech recognition error: $error');
        // Handle errors
      },
    );
  }

  Future<bool> checkPermissions() async {
    final status = await Permission.microphone.request();
    return status.isGranted;
  }

  void startListening({required Function(String command) onResultCommand}) {
    _speechToText.listen(
      onResult: (result) {
        if (result.finalResult) {
          onResultCommand(result.recognizedWords.toLowerCase());
        }
      },
      localeId: 'en_US', // Set the desired locale
      listenFor: Duration(hours: 40), // Set the duration for listening
    );
  }

  void stopListening() {
    _speechToText.stop();
  }
}
