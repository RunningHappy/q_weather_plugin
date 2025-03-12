#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <QWeather/QWeather.h>

@interface GridWeatherApi : NSObject
/// 格点实时天气
+ (void)getGridWeatherNow:(id)parma result:(FlutterResult)result;
/// 格点每日天气预报
+ (void)getGridWeatherDaily:(id)parma result:(FlutterResult)result;
/// 格点逐小时天气预报
+ (void)getGridWeatherHourly:(id)parma result:(FlutterResult)result;
@end

