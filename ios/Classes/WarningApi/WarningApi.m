#import "WarningApi.h"

@implementation WarningApi

+ (void)getWeatherWarningInfo:(id)parma result:(__strong FlutterResult)result {
    NSString *location = parma[@"location"];
    QWeatherConfigInstance.location = location;
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_WARNING WithSuccess:^(WarningBaseClass *rep) {
        if(![rep.code isEqualToString:@"200"]){
            result([NSString stringWithFormat:@"Bad Code:%@",rep.code]);
            return;;
        }
        NSMutableArray<NSDictionary*> *warningList = [NSMutableArray new];
        for (Warning *one in rep.warning)  {
            NSDictionary *oneWarning = @{
                @"id": one.warningId, @"sender": one.sender, @"pubTime":one.pubTime, @"title":one.title,
                @"startTime": one.startTime, @"endTime": one.endTime, @"status": one.status, @"level": one.level,
                @"type": one.type, @"typeName": one.typeName, @"text": one.text, @"related": one.related};
            [warningList addObject:oneWarning];
        }
                
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:warningList forKey:@"warningList"];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
        result([[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    } faileureForError:^(NSError *error) {
        result(@"请求失败");
        NSLog(@"error->%@",error);
    }];
}

+ (void)getWarningCityList:(id)parma result:(FlutterResult)result{
    QWeatherConfigInstance.range = @"cn";
    [QWeatherConfigInstance weatherWithInquireType:INQUIRE_TYPE_WARNINGLIST WithSuccess:^(WarningListClass *rep) {
        if(![rep.code isEqualToString:@"200"]){
            result([NSString stringWithFormat:@"Bad Code:%@",rep.code]);
            return;;
        }
        NSMutableArray<NSDictionary*> *warningLocList = [NSMutableArray new];
        for (WarningLoc *one in rep.warningLocList)  {
            NSDictionary *oneWarningLoc = @{@"locationId": one.locationId};
            [warningLocList addObject:oneWarningLoc];
        }
        
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"updateTime": rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:warningLocList forKey:@"warningBean"];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
        result([[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    } faileureForError:^(NSError *error) {
        result(error);
        NSLog(@"error->%@",error);
    }];
}

@end
