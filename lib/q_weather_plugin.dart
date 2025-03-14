
import 'dart:convert';

import 'q_weather_plugin_platform_interface.dart';

class QWeatherPlugin {
  /// 初始化 SDK
  Future<bool> initialize({
    required String apiKey, /// 你的apiKey
    required String publicID, /// 你的publicID
    required bool isDev, /// 环境
  }) {
    return QWeatherPluginPlatform.instance.initialize(
        apiKey: apiKey,
        publicID: publicID,
        isDev: isDev
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
    required String location, /// 当前经纬度
    required String type /// POI类型(SCENIC、CSTA、TSTA)
  }) {
    return QWeatherPluginPlatform.instance.getGeoPoiLookup(location: location, type: type);
  }
  /// POI范围搜索
  Future<String> getGeoPoiRange({
    required String location, /// 当前经纬度
    required String type /// POI类型(SCENIC、CSTA、TSTA)
  }) {
    return QWeatherPluginPlatform.instance.getGeoPoiRange(location: location, type: type);
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
    required int days, /// 3、7、10、15 (安卓独有30)
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

  /// 空气质量小时预报(new)
  Future<String> getHourlyAirquality({
    required String latitude, /// 当前位置纬度
    required String longitude, /// 当前位置经度
    required bool isDev,
    required String token
  }) {
    return QWeatherPluginPlatform.instance.getHourlyAirquality(
        latitude: latitude,
        longitude: longitude,
        isDev: isDev,
        token: token
    );
  }

  /// 空气质量每日预报(new)
  Future<String> getDailyAirquality({
    required String latitude, /// 当前位置纬度
    required String longitude, /// 当前位置经度
    required bool isDev,
    required String token
  }) {
    return QWeatherPluginPlatform.instance.getDailyAirquality(
        latitude: latitude,
        longitude: longitude,
        isDev: isDev,
        token: token
    );
  }

  /// 实时空气质量
  Future<String> getWeatherAirNow({
    required String location /// 当前经纬度
  }) {
    return QWeatherPluginPlatform.instance.getWeatherAirNow(
      location: location
    );
  }

  /// 空气质量每日预报
  Future<String> getWeatherAirDaily({
    required String location /// 当前经纬度
  }) {
    return QWeatherPluginPlatform.instance.getWeatherAirDaily(
        location: location
    );
  }

  /// 潮汐
  Future<String> getOceanTide({
    required String location, /// 需要查询的潮汐站点
    required String date /// 日期
  }) {
    return QWeatherPluginPlatform.instance.getOceanTide(
        location: location,
        date: date
    );
  }

  /// 潮流
  Future<String> getOceanCurrents({
    required String location, /// 需要查询的潮汐站点
    required String date /// 日期
  }) {
    return QWeatherPluginPlatform.instance.getOceanCurrents(
        location: location,
        date: date
    );
  }

  /// 天气时光机
  Future<String> getHistoricalWeather({
    required String location, /// 需要查询的地区
    required String date /// 日期
  }) {
    return QWeatherPluginPlatform.instance.getHistoricalWeather(
      location: location,
      date: date
    );
  }

  /// 天气时光机
  Future<String> getHistoricalAir({
    required String location, /// 需要查询的地区
    required String date /// 日期
  }) {
    return QWeatherPluginPlatform.instance.getHistoricalAir(
        location: location,
        date: date
    );
  }

  /// 台风列表
  Future<String> getStormList({
    required String basin, /// 台风所在的流域(AL、EP、NP、SP、NI、SI)
    required String year /// 支持查询本年度和上一年度的台风
  }) {
    return QWeatherPluginPlatform.instance.getStormList(
      basin: basin,
      year: year
    );
  }

  /// 台风实况和路径
  Future<String> getStormTrack({
    required String stormId /// 查询的台风ID
  }) {
    return QWeatherPluginPlatform.instance.getStormTrack(
      stormId: stormId
    );
  }

  /// 台风预报
  Future<String> getStormForecast({
    required String stormId /// 查询的台风ID
  }) {
    return QWeatherPluginPlatform.instance.getStormForecast(
      stormId: stormId
    );
  }

  /// 日出日落
  Future<String> getAstronomySun({
    required String location, /// 需要查询的地区
    required String date /// 日期
  }) {
    return QWeatherPluginPlatform.instance.getAstronomySun(
      location: location,
      date: date
    );
  }

  /// 月升月落和月相
  Future<String> getAstronomyMoon({
    required String location, /// 需要查询的地区
    required String date /// 日期
  }) {
    return QWeatherPluginPlatform.instance.getAstronomyMoon(
        location: location,
        date: date
    );
  }

  /// 太阳高度角
  Future<String> getAstronomySunAngle({
    required String location, /// 需要查询的地区
    required String date, /// 日期
    required String time, /// 查询时间
    required String tz, /// 查询地区所在时区
    required String alt /// 海拔高度
  }) {
    return QWeatherPluginPlatform.instance.getAstronomySunAngle(
        location: location,
        date: date,
        time: time,
        tz: tz,
        alt: alt
    );
  }
}
