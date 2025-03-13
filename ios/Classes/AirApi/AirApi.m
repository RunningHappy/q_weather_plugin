#import "AirApi.h"

@implementation AirApi

+ (void)getCurrentWeatherAir:(id)parma result:(__strong FlutterResult)result {
    NSString *location = parma[@"location"];
    QWeatherConfigInstance.location = location;
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_WEATHER_AIR_NOW WithSuccess:^(AirBaseClass *rep) {
        if(![rep.code isEqualToString:@"200"]){
            result([NSString stringWithFormat:@"Bad Code:%@",rep.code]);
            return;
        }
        NSDictionary *now = @{@"pubTime": rep.now.pubTime, @"aqi": rep.now.aqi, @"level": rep.now.level, @"category": rep.now.category,
                                      @"primary": rep.now.primary,  @"pm10": rep.now.pm10, @"pm2p5": rep.now.pm2p5, @"no2": rep.now.no2,
                                      @"so2": rep.now.so2, @"co": rep.now.co, @"o3": rep.now.o3};
        NSMutableArray<NSDictionary*> *stations = [NSMutableArray new];
        for (AirStation *one in rep.airStation)  {
            NSDictionary *oneStation = @{
                @"name": one.name, @"id": one.cid, @"pubTime":one.pubTime, @"aqi":one.aqi, @"level": one.level,
                @"category": one.category, @"primary": one.primary, @"pm10": one.pm10, @"pm2p5": one.pm2p5,
                @"no2": one.no2, @"so2": one.so2, @"co": one.co, @"o3": one.o3};
            [stations addObject:oneStation];
        }
        
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:now forKey:@"now"];
        [dic setValue:stations forKey:@"airNowStationBean"];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
        result([[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    } faileureForError:^(NSError *error) {
        result(@"请求失败");
        NSLog(@"error->%@",error);
    }];
}

+ (void)getDailyWeatherAir:(id)parma result:(__strong FlutterResult)result {
    NSString *location = parma[@"location"];
    QWeatherConfigInstance.location = location;
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_WEATHER_AIR_5D WithSuccess:^(AirBaseClass *rep) {
        if(![rep.code isEqualToString:@"200"]){
            result([NSString stringWithFormat:@"Bad Code:%@",rep.code]);
            return;
        }
        NSMutableArray<NSDictionary*> *daily = [NSMutableArray new];
        for (AirDaily *one in rep.airStation)  {
            NSDictionary *oneDaily = @{
                @"fxDate": one.fxDate, @"aqi": one.aqi, @"level":one.level,@"category":one.category, @"primary": one.primary};
            [daily addObject:oneDaily];
        }
        
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:daily forKey:@"airDailyBeans"];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
        result([[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    } faileureForError:^(NSError *error) {
        result(@"请求失败");
        NSLog(@"error->%@",error);
    }];
}

@end
