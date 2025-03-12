#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <QWeather/QWeather.h>

@interface WarningApi : NSObject
/// 天气灾害预警
+ (void)getWeatherWarningInfo:(id)parma result:(FlutterResult)result;
/// 天气预警城市列表
+ (void)getWarningCityList:(id)parma result:(FlutterResult)result;
@end
