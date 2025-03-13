#import "WeatherApi.h"

@implementation WeatherApi

+ (void)getWeatherNow:(id)param result:(FlutterResult)result {
    NSString *location = param[@"location"];
    QWeatherConfigInstance.location = location;
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_WEATHER_NOW WithSuccess:^(WeatherBaseClass  *rep) {
        if(![rep.code isEqualToString:@"200"]){
            result([NSString stringWithFormat:@"Bad Code:%@",rep.code]);
            return;
        }
        NSDictionary *now = @{@"cloud": rep.now.cloud, @"dew": rep.now.dew, @"feelsLike": rep.now.feelsLike, @"humidity": rep.now.humidity,
                                      @"icon": rep.now.icon,  @"obsTime": rep.now.obsTime, @"precip": rep.now.precip, @"pressure": rep.now.pressure,
                                      @"temp": rep.now.temp, @"text": rep.now.text, @"vis": rep.now.vis, @"wind360": rep.now.wind360,
                                      @"windDir": rep.now.windDir, @"windScale": rep.now.windScale, @"windSpeed": rep.now.windSpeed};
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:now forKey:@"now"];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
        result([[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    } faileureForError:^(NSError *error) {
        result(@"请求失败");
        NSLog(@"error->%@",error);
    }];
}

+ (void)getWeatherDaily:(id)param result:(FlutterResult)result{
    NSString *location = param[@"location"];
    NSNumber *days = param[@"days"];
    INQUIRE_TYPE inquireType = INQUIRE_TYPE_WEATHER_3D;
    if([days isEqualToNumber:@3]){
        inquireType = INQUIRE_TYPE_WEATHER_3D;
    } else if([days isEqualToNumber:@7]){
        inquireType = INQUIRE_TYPE_WEATHER_7D;
    } else if([days isEqualToNumber:@10]){
        inquireType = INQUIRE_TYPE_WEATHER_10D;
    } else {
        inquireType = INQUIRE_TYPE_WEATHER_15D;
    }
    QWeatherConfigInstance.location = location;
    [QWeatherConfigInstance weatherWithInquireType:inquireType WithSuccess:^(WeatherBaseClass  *rep) {
        if (![rep.code isEqualToString:@"200"]){
            result([NSString stringWithFormat:@"Bad Code:%@",rep.code]);
            return;
        }
        NSMutableArray<NSDictionary*> *daily = [NSMutableArray new];
        for (Daily *one in rep.daily) {
            NSDictionary *oneDaily = @{
                @"cloud": one.cloud, @"fxDate": one.fxDate, @"humidity":one.humidity,@"iconDay":one.iconDay, @"iconNight": one.iconNight,
                @"moonPhase": one.moonPhase, @"moonPhaseIcon": one.moonPhaseIcon, @"moonset": one.moonset, @"moonrise": one.moonrise,
                @"precip": one.precip, @"pressure": one.pressure, @"sunrise": one.sunrise, @"sunset": one.sunset, @"tempMax": one.tempMax,
                @"tempMin": one.tempMin, @"textDay": one.textDay, @"textNight": one.textNight, @"uvIndex": one.uvIndex, @"vis": one.vis,
                @"wind360Day": one.wind360Day, @"wind360Night": one.wind360Night, @"windDirDay": one.windDirDay,@"windDirNight": one.WindDirNight,
                @"windScaleDay": one.windScaleDay, @"windScaleNight": one.windScaleNight, @"windSpeedDay": one.windSpeedDay,
                @"windSpeedNight": one.windSpeedNight
            };
            [daily addObject:oneDaily];
        }
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:daily forKey:@"daily"];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
        result([[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    } faileureForError:^(NSError *error) {
        result(@"请求失败");
        NSLog(@"error->%@",error);
    }];
}

+(void)getWeatherHourly:(id)param result:(FlutterResult)result{
    NSString *location = param[@"location"];
    NSNumber *hours = param[@"hours"];
    INQUIRE_TYPE inquireType = INQUIRE_TYPE_WEATHER_24H;
    if([hours isEqualToNumber:@24]){
        inquireType = INQUIRE_TYPE_WEATHER_24H;
    } else if([hours isEqualToNumber:@72]){
        inquireType = INQUIRE_TYPE_WEATHER_72H;
    } else {
        inquireType = INQUIRE_TYPE_WEATHER_168H;
    }
    QWeatherConfigInstance.location = location;
    [QWeatherConfigInstance weatherWithInquireType:inquireType WithSuccess:^(WeatherBaseClass  *rep) {
        if (![rep.code isEqualToString:@"200"]){
            result([NSString stringWithFormat:@"Bad Code:%@",rep.code]);
            return;
        }
        NSMutableArray<NSDictionary*> *hourly = [NSMutableArray new];

        for (Hourly *one in rep.hourly) {
            NSDictionary *oneHourly = @{
                @"cloud": one.cloud, @"fxTime": one.fxTime, @"humidity":one.humidity,@"icon":one.icon, @"precip": one.precip,
                @"pressure": one.pressure, @"temp": one.temp, @"text": one.text, @"wind360": one.wind360, @"windDir": one.windDir,
                @"windScale": one.windScale, @"windSpeed":one.windSpeed, @"dew": one.dew, @"pop": one.pop};
            [hourly addObject:oneHourly];
        }
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:hourly forKey:@"hourly"];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
        result([[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    } faileureForError:^(NSError *error) {
        result(@"请求失败");
        NSLog(@"error->%@",error);
    }];
}

+ (void)getWeatherMinuteLy:(id)param result:(FlutterResult)result{
    NSString *location = param[@"location"];
    QWeatherConfigInstance.location = location;
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_WEATHER_MINUTELY WithSuccess:^(WeatherMinutelyBaseClass *rep){
        if(![rep.code isEqualToString:@"200"]){
            result([NSString stringWithFormat:@"Bad Code:%@",rep.code]);
            return;
        }
        NSMutableArray<NSDictionary*> *minutely = [NSMutableArray new];
        for (Minutely *one in rep.minutely) {
            NSDictionary *oneMinutely = @{@"fxTime": one.fxTime, @"precip": one.precip, @"type": one.type};
            [minutely addObject:oneMinutely];
        }
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:rep.summary forKey:@"summary"];
        [dic setValue:minutely forKey:@"minutely"];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
        result([[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    } faileureForError:^(NSError *error) {
        result(@"请求失败");
        NSLog(@"error->%@",error);
    }];
}

@end
