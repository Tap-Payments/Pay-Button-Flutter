import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'pay_button_flutter_platform_interface.dart';

/// An implementation of [PayButtonFlutterPlatform] that uses method channels.
class MethodChannelPayButtonFlutter extends PayButtonFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('pay_button_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
