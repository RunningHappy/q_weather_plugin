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
    required bool isDev, /// 环境
  }) async {
    return await methodChannel.invokeMethod('initialize',{
      'apiKey': apiKey,
      'publicID': publicID,
      'isDev': isDev
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
    required String location, /// 当前经纬度
    required String type /// POI类型(scenic、CSTA、TSTA)
  }) async {
    return await methodChannel.invokeMethod('getGeoPoiLookup',{
      'location': location,
      'type': type
    });
  }

  Future<String> getGeoPoiRange({
    required String location, /// 当前经纬度
    required String type /// POI类型(SCENIC、CSTA、TSTA)
  }) async {
    return await methodChannel.invokeMethod('getGeoPoiRange',{
      'location': location,
      'type': type
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

  Future<String> getHourlyAirquality({
    required String latitude, /// 当前位置纬度
    required String longitude, /// 当前位置经度
    required bool isDev,
    required String token
  }) async {
    return await methodChannel.invokeMethod('getHourlyAirquality',{
      'latitude': latitude,
      'longitude': longitude,
      'isDev': isDev,
      'token': token
    });
  }

  Future<String> getDailyAirquality({
    required String latitude, /// 当前位置纬度
    required String longitude, /// 当前位置经度
    required bool isDev,
    required String token
  }) async {
    return await methodChannel.invokeMethod('getDailyAirquality',{
      'latitude': latitude,
      'longitude': longitude,
      'isDev': isDev,
      'token': token
    });
  }

  Future<String> getWeatherAirNow({
    required String location /// 当前经纬度
  }) async {
    return await methodChannel.invokeMethod('getWeatherAirNow',{
      'location': location
    });
  }

  Future<String> getWeatherAirDaily({
    required String location /// 当前经纬度
  }) async {
    return await methodChannel.invokeMethod('getWeatherAirDaily',{
      'location': location
    });
  }

  Future<String> getOceanTide({
    required String location, /// 需要查询的潮汐站点
    required String date /// 日期
  }) async {
    return await methodChannel.invokeMethod('getOceanTide',{
      'location': location,
      'date': date
    });
  }

  Future<String> getOceanCurrents({
    required String location, /// 需要查询的潮汐站点
    required String date /// 日期
  }) async {
    return await methodChannel.invokeMethod('getOceanCurrents',{
      'location': location,
      'date': date
    });
  }

  Future<String> getHistoricalWeather({
    required String location, /// 需要查询的地区
    required String date /// 日期
  }) async {
    return await methodChannel.invokeMethod('getHistoricalWeather',{
      'location': location,
      'date': date
    });
  }

  Future<String> getHistoricalAir({
    required String location, /// 需要查询的地区
    required String date /// 日期
  }) async {
    return await methodChannel.invokeMethod('getHistoricalAir',{
      'location': location,
      'date': date
    });
  }

  Future<String> getStormList({
    required String basin, /// 台风所在的流域(AL、EP、NP、SP、NI、SI)
    required String year /// 支持查询本年度和上一年度的台风
  }) async {
    return await methodChannel.invokeMethod('getStormList',{
      'basin': basin,
      'year': year
    });
  }

  Future<String> getStormTrack({
    required String stormId /// 查询的台风ID
  }) async {
      return await methodChannel.invokeMethod('getStormTrack',{
        'stormId': stormId
      });
  }

  Future<String> getStormForecast({
    required String stormId /// 查询的台风ID
  }) async {
      return await methodChannel.invokeMethod('getStormForecast',{
        'stormId': stormId
      });
  }

  Future<String> getAstronomySun({
    required String location, /// 需要查询的地区
    required String date /// 日期
  }) async {
    return await methodChannel.invokeMethod('getAstronomySun',{
      'location': location,
      'date': date
    });
  }

  Future<String> getAstronomyMoon({
    required String location, /// 需要查询的地区
    required String date /// 日期
  }) async {
    return await methodChannel.invokeMethod('getAstronomyMoon',{
      'location': location,
      'date': date
    });
  }

  Future<String> getAstronomySunAngle({
    required String location, /// 需要查询的地区
    required String date, /// 日期
    required String time, /// 查询时间
    required String tz, /// 查询地区所在时区
    required String alt /// 海拔高度
  }) async {
    return await methodChannel.invokeMethod('getAstronomySunAngle',{
      "location": location,
      "date": date,
      "time": time,
      "tz": tz,
      "alt": alt
    });
  }
}
