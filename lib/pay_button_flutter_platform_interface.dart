import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pay_button_flutter_method_channel.dart';

abstract class PayButtonFlutterPlatform extends PlatformInterface {
  /// Constructs a PayButtonFlutterPlatform.
  PayButtonFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static PayButtonFlutterPlatform _instance = MethodChannelPayButtonFlutter();

  /// The default instance of [PayButtonFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelPayButtonFlutter].
  static PayButtonFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PayButtonFlutterPlatform] when
  /// they register themselves.
  static set instance(PayButtonFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
