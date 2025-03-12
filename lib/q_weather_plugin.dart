
import 'dart:convert';

import 'q_weather_plugin_platform_interface.dart';

class QWeatherPlugin {
  /// 初始化 SDK
  Future<bool> initialize({
    required String apiKey, /// 你的apiKey
    required String publicID, /// 你的publicID
  }) {
    return QWeatherPluginPlatform.instance.initialize(
        apiKey: apiKey,
        publicID: publicID
    );
  }
  /// 城市搜索
  Future<String> getCityLookup({
    required String location /// 当前经纬度
  }) {
    var result = QWeatherPluginPlatform.instance.getCityLookup(
        location: location
    );
    return result;
  }
  /// 热门城市查询
  Future<String> getGeoTopCity() {
    return QWeatherPluginPlatform.instance.getGeoTopCity();
  }
  /// POI搜索
  Future<String> getGeoPoiLookup({
    required String location /// 当前经纬度
  }) {
    return QWeatherPluginPlatform.instance.getGeoPoiLookup(location: location);
  }
  /// POI范围搜索
  Future<String> getGeoPoiRange({
    required String location /// 当前经纬度
  }) {
    return QWeatherPluginPlatform.instance.getGeoPoiRange(location: location);
  }

  /// 实时天气
  Future<String> getWeatherNow({
    required String location /// 当前经纬度
  }) {
    return QWeatherPluginPlatform.instance.getWeatherNow(location: location);
  }

  /// 每日天气预报
  Future<String> getWeatherDaily({
    required String location, /// 当前经纬度
    required int days, /// 3、7、10、15
  }) {
    return QWeatherPluginPlatform.instance.getWeatherDaily(
      location: location,
      days: days
    );
  }

  /// 逐小时天气预报
  Future<String> getWeatherHourly({
    required String location, /// 当前经纬度
    required int hours, /// 24、72、168
  }) {
    return QWeatherPluginPlatform.instance.getWeatherHourly(
        location: location,
        hours: hours
    );
  }

  /// 分钟级降水
  Future<String> getWeatherMinuteLy({
  required String location, /// 当前经纬度
  }) {
    return QWeatherPluginPlatform.instance.getWeatherMinuteLy(
        location: location
    );
  }

  /// 格点实时天气
  Future<String> getGridWeatherNow({
    required String location, /// 当前经纬度
    required bool isDev, /// 环境
    required String token /// 你的apiKey
  }) {
    return QWeatherPluginPlatform.instance.getGridWeatherNow(
        location: location,
      isDev: isDev,
      token: token
    );
  }

  /// 格点每日天气预报
  Future<String> getGridWeatherDaily({
    required String location, /// 当前经纬度
    required bool isDev, /// 环境
    required String token, /// 你的apiKey
    required int days /// 3、7
  }) {
    return QWeatherPluginPlatform.instance.getGridWeatherDaily(
        location: location,
        isDev: isDev,
        token: token,
        days: days
    );
  }

  /// 格点逐小时天气预报
  Future<String> getGridWeatherHourly({
    required String location, /// 当前经纬度
    required bool isDev, /// 环境
    required String token, /// 你的apiKey
    required int hours /// 24、72
  }) {
    return QWeatherPluginPlatform.instance.getGridWeatherHourly(
        location: location,
        isDev: isDev,
        token: token,
        hours: hours
    );
  }

  /// 天气灾害预警
  Future<String> getWeatherWarningInfo({
    required String location /// 当前经纬度
  }) {
    return QWeatherPluginPlatform.instance.getWeatherWarningInfo(
      location: location
    );
  }

  /// 天气预警城市列表
  Future<String> getWarningCityList() {
    return QWeatherPluginPlatform.instance.getWarningCityList();
  }

  /// 天气指数预报
  Future<String> getDayWeatherIndices({
    required String location, /// 当前经纬度
    required int day /// 1、3
  }) {
    return QWeatherPluginPlatform.instance.getDayWeatherIndices(
      location: location,
      day: day
    );
  }

  /// 实时空气质量(new)
  Future<String> getCurrentAirquality({
    required String latitude, /// 当前位置纬度
    required String longitude, /// 当前位置经度
    required bool isDev,
    required String token
  }) {
    return QWeatherPluginPlatform.instance.getCurrentAirquality(
      latitude: latitude,
      longitude: longitude,
      isDev: isDev,
      token: token
    );
  }
}
