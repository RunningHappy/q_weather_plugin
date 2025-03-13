#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <QWeather/QWeather.h>

@interface AirNewApi : NSObject
/// 实时空气质量
+ (void)getCurrentAirquality:(id)parma result:(FlutterResult)result;
/// 空气质量小时预报
+ (void)getHourlyAirquality:(id)parma result:(FlutterResult)result;
/// 空气质量每日预报
+ (void)getDailyAirquality:(id)parma result:(FlutterResult)result;
@end
