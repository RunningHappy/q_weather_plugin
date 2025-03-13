#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <QWeather/QWeather.h>

@interface HistoricalApi : NSObject
/// 天气时光机
+ (void)getHistoricalWeather:(id)parma result:(FlutterResult)result;
/// 历史空气质量
+ (void)getHistoricalAir:(id)parma result:(FlutterResult)result;
@end
