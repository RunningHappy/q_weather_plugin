#import "AstronomyApi.h"

@implementation AstronomyApi
+ (void)getAstronomySun:(id)parma result:(FlutterResult)result{
    NSString *location = parma[@"location"];
    NSString *date = parma[@"date"];
    QWeatherConfigInstance.location = location;
    QWeatherConfigInstance.date = date;
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_ASTRONOMY_SUN WithSuccess:^(SunBaseModel *rep) {
        if(![rep.code isEqualToString:@"200"]){
            result([NSString stringWithFormat:@"Bad Code:%@",rep.code]);
            return;
        }
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:rep.sunrise forKey:@"sunrise"];
        [dic setValue:rep.sunset forKey:@"sunset"];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
        result([[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    } faileureForError:^(NSError *error) {
        result(@"请求失败");
        NSLog(@"error->%@",error);
    }];
}
+ (void)getAstronomyMoon:(id)parma result:(__strong FlutterResult)result {
    NSString *location = parma[@"location"];
    NSString *date = parma[@"date"];
    QWeatherConfigInstance.location = location;
    QWeatherConfigInstance.date = date;
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_ASTRONOMY_MOON WithSuccess:^(MoonBaseModel *rep) {
        if(![rep.code isEqualToString:@"200"]){
            result([NSString stringWithFormat:@"Bad Code:%@",rep.code]);
            return;
        }
        NSMutableArray<NSDictionary*> *moonPhaseList = [NSMutableArray new];
        for (MoonPhase *one in rep.moonPhases) {
            NSDictionary *oneMoonPhase = @{@"fxTime": one.fxTime, @"value": one.value, @"name":one.name,
                                           @"icon":one.icon, @"illumination": one.illumination};
            [moonPhaseList addObject:oneMoonPhase];
        }
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:rep.moonrise forKey:@"moonrise"];
        [dic setValue:rep.moonset forKey:@"moonset"];
        [dic setValue:moonPhaseList forKey:@"moonPhaseBeanList"];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
        result([[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    } faileureForError:^(NSError *error) {
        result(@"请求失败");
        NSLog(@"error->%@",error);
    }];
}
+ (void)getAstronomySunAngle:(id)parma result:(FlutterResult)result{
    NSString *location = parma[@"location"];
    NSString *date = parma[@"date"];
    NSString *time = parma[@"time"];
    NSString *tz = parma[@"tz"];
    NSString *alt = parma[@"alt"];
    QWeatherConfigInstance.location = location;
    QWeatherConfigInstance.date = date;
    QWeatherConfigInstance.time = time;
    QWeatherConfigInstance.tz = tz;
    QWeatherConfigInstance.alt = alt;
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_ASTRONOMY_SUN_ANGLE WithSuccess:^(SunAngleBaseModel *rep) {
        if(![rep.code isEqualToString:@"200"]){
            result([NSString stringWithFormat:@"Bad Code:%@",rep.code]);
            return;
        }
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:rep.solarElevationAngle forKey:@"solarElevationAngle"];
        [dic setValue:rep.solarAzimuthAngle forKey:@"solarAzimuthAngle"];
        [dic setValue:rep.solarHour forKey:@"solarHour"];
        [dic setValue:rep.hourAngle forKey:@"hourAngle"];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
        result([[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    } faileureForError:^(NSError *error) {
        result(@"请求失败");
        NSLog(@"error->%@",error);
    }];
}

@end
