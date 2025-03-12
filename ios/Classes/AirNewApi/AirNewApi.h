#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <QWeather/QWeather.h>

@interface AirNewApi : NSObject
/// 实时空气质量
+ (void)getCurrentAirquality:(id)parma result:(FlutterResult)result;
@end
