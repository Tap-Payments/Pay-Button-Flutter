import 'package:flutter_test/flutter_test.dart';
import 'package:pay_button_flutter/pay_button_flutter_platform_interface.dart';
import 'package:pay_button_flutter/pay_button_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPayButtonFlutterPlatform
    with MockPlatformInterfaceMixin
    implements PayButtonFlutterPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PayButtonFlutterPlatform initialPlatform =
      PayButtonFlutterPlatform.instance;

  test('$MethodChannelPayButtonFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPayButtonFlutter>());
  });

  test('getPlatformVersion', () async {
    MockPayButtonFlutterPlatform fakePlatform = MockPayButtonFlutterPlatform();
    PayButtonFlutterPlatform.instance = fakePlatform;
  });
}
