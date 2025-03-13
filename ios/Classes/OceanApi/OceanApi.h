#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <QWeather/QWeather.h>

@interface OceanApi : NSObject
/// 潮汐
+ (void)getOceanTide:(id)parma result:(FlutterResult)result;
/// 潮流
+ (void)getOceanCurrents:(id)parma result:(FlutterResult)result;
@end
