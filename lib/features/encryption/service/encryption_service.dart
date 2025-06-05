import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptionService {
  final String _keyString =
      'a1b2c3d4e5f6g7h8i9j0k1l2m3n4o5p6'; // 32 chars for AES-256
  final String _ivString = 'q1w2e3r4t5y6u7i8'; // 16 chars for AES

  late encrypt.Encrypter encrypter;
  late encrypt.IV iv;

  EncryptionService() {
    final key = encrypt.Key.fromUtf8(_keyString);
    iv = encrypt.IV.fromUtf8(_ivString);
    encrypter = encrypt.Encrypter(encrypt.AES(key));
  }
}
