import 'package:torch_light/torch_light.dart';

class FlashlightService {
  // Method to turn on the flashlight
  Future<void> turnOn() async {
    await TorchLight.enableTorch();
  }

  // Method to turn off the flashlight
  Future<void> turnOff() async {
    await TorchLight.disableTorch();
  }
}
