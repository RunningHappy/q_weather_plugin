#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <QWeather/QWeather.h>

@interface AstronomyApi : NSObject
/// 日出日落
+ (void)getAstronomySun:(id)parma result:(FlutterResult)result;
/// 月升月落和月相
+ (void)getAstronomyMoon:(id)parma result:(FlutterResult)result;
/// 太阳高度角
+ (void)getAstronomySunAngle:(id)parma result:(FlutterResult)result;
@end
