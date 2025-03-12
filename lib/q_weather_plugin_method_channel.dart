import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'q_weather_plugin_platform_interface.dart';

/// An implementation of [QWeatherPluginPlatform] that uses method channels.
class MethodChannelQWeatherPlugin extends QWeatherPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('q_weather_plugin');

  Future<bool> initialize({
    required String apiKey, /// 你的apiKey
    required String publicID, /// 你的publicID
  }) async {
    return await methodChannel.invokeMethod('initialize',{
      'apiKey': apiKey,
      'publicID': publicID
    });
  }

  Future<String> getCityLookup({
    required String location /// 当前经纬度
  }) async {
    return await methodChannel.invokeMethod('getCityLookup',{
      'location': location
    });
  }

  Future<String> getGeoTopCity() async {
    return await methodChannel.invokeMethod('getGeoTopCity');
  }

  Future<String> getGeoPoiLookup({
    required String location /// 当前经纬度
  }) async {
    return await methodChannel.invokeMethod('getGeoPoiLookup',{
      'location': location
    });
  }

  Future<String> getGeoPoiRange({
    required String location /// 当前经纬度
  }) async {
    return await methodChannel.invokeMethod('getGeoPoiRange',{
      'location': location
    });
  }

  Future<String> getWeatherNow({
    required String location /// 当前经纬度
  }) async {
    return await methodChannel.invokeMethod('getWeatherNow',{
      'location': location
    });
  }

  Future<String> getWeatherDaily({
    required String location, /// 当前经纬度
    required int days,
  }) async {
    return await methodChannel.invokeMethod('getWeatherDaily',{
      'location': location,
      'days': days
    });
  }

  Future<String> getWeatherHourly({
    required String location, /// 当前经纬度
    required int hours,
  }) async {
    return await methodChannel.invokeMethod('getWeatherHourly',{
      'location': location,
      'hours': hours
    });
  }

  Future<String> getWeatherMinuteLy({
    required String location, /// 当前经纬度
  }) async {
    return await methodChannel.invokeMethod('getWeatherMinuteLy',{
      'location': location
    });
  }

  Future<String> getGridWeatherNow({
    required String location, /// 当前经纬度
    required bool isDev, /// 环境
    required String token /// 你的apiKey
  }) async {
    return await methodChannel.invokeMethod('getGridWeatherNow',{
      'location': location,
      'isDev': isDev,
      'token': token
    });
  }

  Future<String> getGridWeatherDaily({
    required String location, /// 当前经纬度
    required bool isDev, /// 环境
    required String token, /// 你的apiKey
    required int days /// 3、7
  }) async {
    return await methodChannel.invokeMethod('getGridWeatherDaily',{
      'location': location,
      'isDev': isDev,
      'token': token,
      'days': days
    });
  }

  Future<String> getGridWeatherHourly({
    required String location, /// 当前经纬度
    required bool isDev, /// 环境
    required String token, /// 你的apiKey
    required int hours /// 24、72
  }) async {
    return await methodChannel.invokeMethod('getGridWeatherHourly',{
      'location': location,
      'isDev': isDev,
      'token': token,
      'hours': hours
    });
  }

  Future<String> getWeatherWarningInfo({
    required String location /// 当前经纬度
  }) async {
    return await methodChannel.invokeMethod('getWeatherWarningInfo',{
      'location': location
    });
  }

  Future<String> getWarningCityList() async {
    return await methodChannel.invokeMethod('getWarningCityList');
  }

  Future<String> getDayWeatherIndices({
    required String location, /// 当前经纬度
    required int day
  }) async {
    return await methodChannel.invokeMethod('getDayWeatherIndices',{
      'location': location,
      'day': day
    });
  }

  Future<String> getCurrentAirquality({
    required String latitude, /// 当前位置纬度
    required String longitude, /// 当前位置经度
    required bool isDev,
    required String token
  }) async {
    return await methodChannel.invokeMethod('getCurrentAirquality',{
      'latitude': latitude,
      'longitude': longitude,
      'isDev': isDev,
      'token': token
    });
  }
}
