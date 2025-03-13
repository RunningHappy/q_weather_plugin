#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <QWeather/QWeather.h>

@interface StormApi : NSObject
/// 台风列表
+ (void)getStormList:(id)parma result:(FlutterResult)result;
/// 台风实况和路径
+ (void)getStormTrack:(id)parma result:(FlutterResult)result;
/// 台风预报
+ (void)getStormForecast:(id)parma result:(FlutterResult)result;
@end
