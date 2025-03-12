import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:q_weather_plugin/q_weather_plugin_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelQWeatherPlugin platform = MethodChannelQWeatherPlugin();
  const MethodChannel channel = MethodChannel('q_weather_plugin');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });
}
