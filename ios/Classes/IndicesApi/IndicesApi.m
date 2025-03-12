#import "IndicesApi.h"

@implementation IndicesApi
+ (void)getDayWeatherIndices:(id)parma result:(FlutterResult)result{
    NSString *location = parma[@"location"];
    QWeatherConfigInstance.location = location;
    QWeatherConfigInstance.indices = @[@(INDICES_TYPE_all)];
    NSNumber *day = parma[@"day"];
    INQUIRE_TYPE inquireType = INQUIRE_TYPE_INDICES_1D;
    if([day isEqualToNumber:@1]){
        inquireType = INQUIRE_TYPE_INDICES_1D;
    }else{
        inquireType = INQUIRE_TYPE_INDICES_3D;
    }
    [QWeatherConfigInstance weatherWithInquireType:inquireType WithSuccess:^(IndicesBaseClass *rep) {
        if(![rep.code isEqualToString:@"200"]){
            result(NULL);
            return;
        }
        NSMutableArray<NSDictionary*> *dailyList = [NSMutableArray new];
        for (IndicesDaily *one in rep.daily) {
            NSDictionary *oneIndicesDaily = @{@"date": one.date, @"type": one.type, @"name":one.name,@"level":one.level, @"category": one.category, @"text": one.text};
            [dailyList addObject:oneIndicesDaily];
        }
        NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
        NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setValue:rep.code forKey:@"code"];
        [dic setValue:refer forKey:@"refer"];
        [dic setValue:basic forKey:@"basic"];
        [dic setValue:dailyList forKey:@"dailyList"];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:0 error:&error];
        result([[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    } faileureForError:^(NSError *error) {
        result(error);
        NSLog(@"error->%@",error);
    }];
}
@end
