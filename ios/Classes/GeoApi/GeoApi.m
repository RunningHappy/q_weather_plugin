#import "GeoApi.h"

@implementation GeoApi
+ (void)geoCityLookup:(id)param result:(FlutterResult)result{
    NSString *location = param[@"location"];
    QWeatherConfigInstance.location = location;
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_GEO_CITY_LOOKUP WithSuccess:^(GeoBaseClass  *rep) {
        if (![rep.code isEqualToString:@"200"]){
            result([NSString stringWithFormat:@"Bad Code:%@",rep.code]);
            return;
        }
        NSMutableArray<NSDictionary*> *locations = [NSMutableArray new];
        for (Location *one in rep.location) {
            NSDictionary *oneLocation = @{@"name":one.name, @"id":one.cid, @"lon":one.lon, @"lat":one.lat, @"adm2":one.adm2,
                                          @"adm1":one.adm1, @"country":one.country, @"tz":one.tz, @"utcOffset":one.utcOffset,
                                          @"isDst":one.isDst, @"type":one.type, @"rank":one.rank, @"fxLink":one.fxLink};
            [locations addObject:oneLocation];
        }
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:locations forKey:@"locations"];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
        result([[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    } faileureForError:^(NSError *error) {
        result(@"请求失败");
        NSLog(@"error->%@",error);
    }];
}
+ (void)geoPoiLookup:(id)param result:(FlutterResult)result {
    NSString *location = param[@"location"];
    NSString *type = param[@"type"];
    QWeatherConfigInstance.location = location;
    QWeatherConfigInstance.type = type;
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_GEO_POI_LOOKUP WithSuccess:^(GeoBaseClass *rep) {
        if(![rep.code isEqualToString:@"200"]){
            result([NSString stringWithFormat:@"Bad Code:%@",rep.code]);
            return;;
        }
        NSMutableArray<NSDictionary*> *locations = [NSMutableArray new];
        for (Location *one in rep.location) {
            NSDictionary *oneLocation = @{@"name":one.name, @"id":one.cid, @"lon":one.lon, @"lat":one.lat, @"adm2":one.adm2,
                                          @"adm1":one.adm1, @"country":one.country, @"tz":one.tz, @"utcOffset":one.utcOffset,
                                          @"isDst":one.isDst, @"type":one.type, @"rank":one.rank, @"fxLink":one.fxLink};
            [locations addObject:oneLocation];
        }
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:locations forKey:@"locations"];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
        result([[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    } faileureForError:^(NSError *error) {
        result(@"请求失败");
        NSLog(@"error->%@",error);
    }];
}

+ (void)geoPoiRangeLookup:(id)param result:(FlutterResult)result {
    NSString *location = param[@"location"];
    QWeatherConfigInstance.location = location;
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_GEO_POI_RANGE WithSuccess:^(GeoBaseClass *rep) {
        if(![rep.code isEqualToString:@"200"]){
            result([NSString stringWithFormat:@"Bad Code:%@",rep.code]);
            return;;
        }
        NSMutableArray<NSDictionary*> *locations = [NSMutableArray new];
        for (Location *one in rep.location) {
            NSDictionary *oneLocation = @{@"name":one.name, @"id":one.cid, @"lon":one.lon, @"lat":one.lat, @"adm2":one.adm2,
                                          @"adm1":one.adm1, @"country":one.country, @"tz":one.tz, @"utcOffset":one.utcOffset,
                                          @"isDst":one.isDst, @"type":one.type, @"rank":one.rank, @"fxLink":one.fxLink};
            [locations addObject:oneLocation];
        }
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:locations forKey:@"locations"];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
        result([[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    } faileureForError:^(NSError *error) {
        result(@"请求失败");
        NSLog(@"error->%@",error);
    }];
}

+ (void)getGeoTopCity:(id)param result:(FlutterResult)result {
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_GEO_TOPCITY WithSuccess:^(GeoBaseClass  *rep) {
        if(![rep.code isEqualToString:@"200"]){
            result([NSString stringWithFormat:@"Bad Code:%@",rep.code]);
            return;
        }
        NSMutableArray<NSDictionary*> *locations = [NSMutableArray new];
        for (Location *one in rep.location) {
            NSDictionary *oneLocation = @{@"name":one.name, @"id":one.cid, @"lon":one.lon, @"lat":one.lat, @"adm2":one.adm2,
                                          @"adm1":one.adm1, @"country":one.country, @"tz":one.tz, @"utcOffset":one.utcOffset,
                                          @"isDst":one.isDst, @"type":one.type, @"rank":one.rank, @"fxLink":one.fxLink};
            [locations addObject:oneLocation];
        }
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:locations forKey:@"locations"];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
        result([[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    } faileureForError:^(NSError *error) {
        result(@"请求失败");
        NSLog(@"error->%@",error);
    }];
}

@end
