import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'q_weather_plugin_method_channel.dart';

abstract class QWeatherPluginPlatform extends PlatformInterface {
  /// Constructs a QWeatherPluginPlatform.
  QWeatherPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static QWeatherPluginPlatform _instance = MethodChannelQWeatherPlugin();

  /// The default instance of [QWeatherPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelQWeatherPlugin].
  static QWeatherPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [QWeatherPluginPlatform] when
  /// they register themselves.
  static set instance(QWeatherPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> initialize({
    required String apiKey, /// 你的apiKey
    required String publicID, /// 你的publicID
  }) {
    throw UnimplementedError('initialize() has not been implemented.');
  }

  Future<String> getCityLookup({
    required String location /// 当前经纬度
  }) {
    throw UnimplementedError('getCityLookup() has not been implemented.');
  }

  Future<String> getGeoTopCity() {
    throw UnimplementedError('getGeoTopCity() has not been implemented.');
  }

  Future<String> getGeoPoiLookup({
    required String location /// 当前经纬度
  }) {
    throw UnimplementedError('getGeoPoiLookup() has not been implemented.');
  }

  Future<String> getGeoPoiRange({
    required String location /// 当前经纬度
  }) {
    throw UnimplementedError('getGeoPoiRange() has not been implemented.');
  }

  Future<String> getWeatherNow({
    required String location /// 当前经纬度
  }) {
    throw UnimplementedError('getWeatherNow() has not been implemented.');
  }

  Future<String> getWeatherDaily({
    required String location, /// 当前经纬度
    required int days
  }) {
    throw UnimplementedError('getWeatherDaily() has not been implemented.');
  }

  Future<String> getWeatherHourly({
    required String location, /// 当前经纬度
    required int hours
  }) {
    throw UnimplementedError('getWeatherHourly() has not been implemented.');
  }

  Future<String> getWeatherMinuteLy({
    required String location, /// 当前经纬度
  }) {
    throw UnimplementedError('getWeatherMinuteLy() has not been implemented.');
  }

  Future<String> getGridWeatherNow({
    required String location, /// 当前经纬度
    required bool isDev, /// 环境
    required String token /// 你的apiKey
  }) {
    throw UnimplementedError('getGridWeatherNow() has not been implemented.');
  }

  Future<String> getGridWeatherDaily({
    required String location, /// 当前经纬度
    required bool isDev, /// 环境
    required String token, /// 你的apiKey
    required int days /// 3、7
  }) {
    throw UnimplementedError('getGridWeatherDaily() has not been implemented.');
  }

  Future<String> getGridWeatherHourly({
    required String location, /// 当前经纬度
    required bool isDev, /// 环境
    required String token, /// 你的apiKey
    required int hours /// 24、72
  }) {
    throw UnimplementedError('getGridWeatherHourly() has not been implemented.');
  }

  Future<String> getWeatherWarningInfo({
    required String location /// 当前经纬度
  }) {
    throw UnimplementedError('getWeatherWarningInfo() has not been implemented.');
  }

  Future<String> getWarningCityList() {
    throw UnimplementedError('getWarningCityList() has not been implemented.');
  }

  Future<String> getDayWeatherIndices({
    required String location, /// 当前经纬度
    required int day
  }) {
    throw UnimplementedError('getDayWeatherIndices() has not been implemented');
  }

  Future<String> getCurrentAirquality({
    required String latitude, /// 当前位置纬度
    required String longitude, /// 当前位置经度
    required bool isDev,
    required String token
  }) {
    throw UnimplementedError('getCurrentAirquality() has not been implemented');
  }
}
