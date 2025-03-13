#import "OceanApi.h"

@implementation OceanApi

+ (void)getOceanTide:(id)parma result:(__strong FlutterResult)result {
    NSString *location = parma[@"location"];
    NSString *date = parma[@"date"];
    QWeatherConfigInstance.location = location;
    QWeatherConfigInstance.date = date;
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_OCEAN_TIDE WithSuccess:^(OceanTideBaseClass *rep) {
        if(![rep.code isEqualToString:@"200"]){
            result([NSString stringWithFormat:@"Bad Code:%@",rep.code]);
            return;
        }
        NSMutableArray<NSDictionary*> *tideList = [NSMutableArray new];
        for (TideTable *one in rep.tideTable)  {
            NSDictionary *oneTide = @{@"fxTime":one.fxTime, @"height":one.height, @"type": one.type};
            [tideList addObject:oneTide];
        }
        NSMutableArray<NSDictionary*> *tideHourlyList = [NSMutableArray new];
        for (TideHourly *one in rep.tideHourly)  {
            NSDictionary *oneTideHourly = @{@"fxTime":one.fxTime, @"height":one.height};
            [tideHourlyList addObject:oneTideHourly];
        }

        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime":rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:tideList forKey:@"tideTable"];
        [dic setValue:tideHourlyList forKey:@"tideHourlyList"];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
        result([[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    } faileureForError:^(NSError *error) {
        result(@"请求失败");
        NSLog(@"error->%@",error);
    }];
}

+ (void)getOceanCurrents:(id)parma result:(__strong FlutterResult)result {
    NSString *location = parma[@"location"];
    NSString *date = parma[@"date"];
    QWeatherConfigInstance.location = location;
    QWeatherConfigInstance.date = date;
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_OCEAN_TIDE WithSuccess:^(OceanCurrentsBaseClass *rep) {
        if(![rep.code isEqualToString:@"200"]){
            result([NSString stringWithFormat:@"Bad Code:%@",rep.code]);
            return;
        }
        NSMutableArray<NSDictionary*> *currentsList = [NSMutableArray new];
        for (CurrentsTable *one in rep.currentsTable)  {
            NSDictionary *oneCurrents = @{@"fxTime":one.fxTime, @"speedMax":one.speedMax, @"dir360": one.dir360};
            [currentsList addObject:oneCurrents];
        }
        NSMutableArray<NSDictionary*> *currentsHourlyList = [NSMutableArray new];
        for (CurrentsHourly *one in rep.currentsHourly)  {
            NSDictionary *oneCurrentsHourly = @{@"fxTime":one.fxTime, @"speed":one.speed, @"dir360": one.dir360};
            [currentsHourlyList addObject:oneCurrentsHourly];
        }

        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime":rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:currentsList forKey:@"tableList"];
        [dic setValue:currentsHourlyList forKey:@"hourlyList"];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
        result([[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    } faileureForError:^(NSError *error) {
        result(@"请求失败");
        NSLog(@"error->%@",error);
    }];
}

@end
