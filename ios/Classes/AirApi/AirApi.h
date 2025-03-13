#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <QWeather/QWeather.h>

@interface AirApi : NSObject
/// 实时空气质量
+ (void)getCurrentWeatherAir:(id)parma result:(FlutterResult)result;
/// 空气质量每日预报
+ (void)getDailyWeatherAir:(id)parma result:(FlutterResult)result;
@end
