#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <QWeather/QWeather.h>

@interface IndicesApi : NSObject
/// 天气指数预报
+ (void)getDayWeatherIndices:(id)parma result:(FlutterResult)result;
@end
