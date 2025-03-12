import 'package:flutter_test/flutter_test.dart';
import 'package:q_weather_plugin/q_weather_plugin.dart';
import 'package:q_weather_plugin/q_weather_plugin_platform_interface.dart';
import 'package:q_weather_plugin/q_weather_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockQWeatherPluginPlatform
    with MockPlatformInterfaceMixin
    implements QWeatherPluginPlatform {
  @override
  Future<bool> initialize({required String apiKey, required String publicID}) {
    // TODO: implement initialize
    throw UnimplementedError();
  }

  @override
  Future<String> getCityLookup({required String location}) {
    // TODO: implement getCityLookup
    throw UnimplementedError();
  }

  @override
  Future<String> getGeoTopCity() {
    // TODO: implement getGeoTopCity
    throw UnimplementedError();
  }

  @override
  Future<String> getGeoPoiLookup({
    required String location /// 当前经纬度
  }) {
    // TODO: implement getGeoPoiLookup
    throw UnimplementedError();
  }

  @override
  Future<String> getGeoPoiRange({required String location}) {
    // TODO: implement getGeoPoiRange
    throw UnimplementedError();
  }

  @override
  Future<String> getWeatherNow({required String location}) {
    // TODO: implement getWeatherNow
    throw UnimplementedError();
  }

  @override
  Future<String> getWeatherDaily({required String location, required int days}) {
    // TODO: implement getWeatherDaily
    throw UnimplementedError();
  }

  @override
  Future<String> getWeatherHourly({required String location, required int hours}) {
    // TODO: implement getWeatherHours
    throw UnimplementedError();
  }

  @override
  Future<String> getWeatherMinuteLy({required String location}) {
    // TODO: implement getWeatherMinuteLy
    throw UnimplementedError();
  }

  @override
  Future<String> getGridWeatherNow({required String location, required bool isDev, required String token}) {
    // TODO: implement getGridWeatherNow
    throw UnimplementedError();
  }

  @override
  Future<String> getGridWeatherDaily({required String location, required bool isDev, required String token, required int days}) {
    // TODO: implement getGridWeatherDaily
    throw UnimplementedError();
  }

  @override
  Future<String> getGridWeatherHourly({required String location, required bool isDev, required String token, required int hours}) {
    // TODO: implement getGridWeatherHourly
    throw UnimplementedError();
  }

  @override
  Future<String> getWeatherWarningInfo({required String location}) {
    // TODO: implement getWeatherWarningInfo
    throw UnimplementedError();
  }

  @override
  Future<String> getWarningCityList() {
    // TODO: implement getWarningCityList
    throw UnimplementedError();
  }

  @override
  Future<String> getDayWeatherIndices({required String location, required int day}) {
    // TODO: implement getDayWeatherIndices
    throw UnimplementedError();
  }

  @override
  Future<String> getCurrentAirquality({required String latitude, required String longitude, required bool isDev, required String token}) {
    // TODO: implement getCurrentAirquality
    throw UnimplementedError();
  }

}

void main() {
  final QWeatherPluginPlatform initialPlatform = QWeatherPluginPlatform.instance;

  test('$MethodChannelQWeatherPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelQWeatherPlugin>());
  });
}
