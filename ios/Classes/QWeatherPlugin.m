#import "QWeatherPlugin.h"
#import <Flutter/Flutter.h>
#import <QWeather/QWeather.h>
#import "GeoApi/GeoApi.h"
#import "WeatherApi/WeatherApi.h"
#import "GridWeatherApi/GridWeatherApi.h"
#import "WarningApi/WarningApi.h"
#import "IndicesApi/IndicesApi.h"
#import "AirNewApi/AirNewApi.h"

@implementation QWeatherPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel *channel = [FlutterMethodChannel
            methodChannelWithName:@"q_weather_plugin"
                  binaryMessenger:[registrar messenger]];
    QWeatherPlugin *instance = [[QWeatherPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([call.method isEqualToString:@"initialize"]) {
        NSString *apiKey = call.arguments[@"apiKey"];
        NSString *publicID = call.arguments[@"publicID"];
        if(apiKey && publicID){
            QWeatherConfigInstance.publicID = publicID;
            QWeatherConfigInstance.appKey   = apiKey;
            QWeatherConfigInstance.lang     = @"zh";
            QWeatherConfigInstance.unit     = @"m";
            QWeatherConfigInstance.appType  = APP_TYPE_DEV;
        }else{
            result([FlutterError errorWithCode:@"INVALID_ARGUMENT"
                                       message:@"appKey is null"
                                       details:false]);
        }
    } else if ([call.method isEqualToString:@"getCityLookup"]) {
        [GeoApi geoCityLookup:call.arguments result:result];
    } else if ([call.method isEqualToString:@"getGeoTopCity"]) {
        [GeoApi getGeoTopCity:call.arguments result:result];
    } else if ([call.method isEqualToString:@"getGeoPoiLookup"]) {
        [GeoApi geoPoiLookup:call.arguments result:result];
    } else if ([call.method isEqualToString:@"getGeoPoiRange"]) {
        [GeoApi geoPoiRangeLookup:call.arguments result:result];
    } else if ([call.method isEqualToString:@"getWeatherNow"]) {
        [WeatherApi getWeatherNow:call.arguments result:result];
    } else if ([call.method isEqualToString:@"getWeatherDaily"]) {
        [WeatherApi getWeatherDaily:call.arguments result:result];
    } else if ([call.method isEqualToString:@"getWeatherHourly"]) {
        [WeatherApi getWeatherHourly:call.arguments result:result];
    } else if ([call.method isEqualToString:@"getWeatherMinuteLy"]) {
        [WeatherApi getWeatherMinuteLy:call.arguments result:result];
    } else if ([call.method isEqualToString:@"getGridWeatherNow"]) {
        [GridWeatherApi getGridWeatherNow:call.arguments result:result];
    } else if ([call.method isEqualToString:@"getGridWeatherDaily"]) {
        [GridWeatherApi getGridWeatherDaily:call.arguments result:result];
    } else if ([call.method isEqualToString:@"getGridWeatherHourly"]) {
        [GridWeatherApi getGridWeatherHourly:call.arguments result:result];
    } else if ([call.method isEqualToString:@"getWeatherWarningInfo"]) {
        [WarningApi getWeatherWarningInfo:call.arguments result:result];
    } else if ([call.method isEqualToString:@"getWarningCityList"]) {
        [WarningApi getWarningCityList:call.arguments result:result];
    } else if ([call.method isEqualToString:@"getDayWeatherIndices"]) {
        [IndicesApi getDayWeatherIndices:call.arguments result:result];
    } else if ([call.method isEqualToString:@"getCurrentAirquality"]) {
        [AirNewApi getCurrentAirquality:call.arguments result:result];
    } else {
        result(FlutterMethodNotImplemented);
    }
}



@end
