#import "AirNewApi.h"
#import <AFNetworking/AFNetworking.h>

@implementation AirNewApi
+ (void)getCurrentAirquality:(id)parma result:(FlutterResult)result{
    NSString *latitude = parma[@"latitude"];
    NSString *longitude = parma[@"longitude"];
    BOOL isDev = parma[@"isDev"];
    NSString *requestUrl = @"";
    if(isDev){
        requestUrl = [NSString stringWithFormat:@"https://devapi.qweather.com/airquality/v1/current/%@/%@",latitude,longitude];
    }else{
        requestUrl = [NSString stringWithFormat:@"https://api.qweather.com/airquality/v1/current/%@/%@",latitude,longitude];
    }
    NSDictionary *parameter = @{@"key": parma[@"token"]};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:requestUrl parameters:parameter headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if(![responseObject[@"code"] isEqualToString:@"200"]){
//            result(NULL);
//            return;
//        }
//        NSDictionary *now = @{@"cloud": responseObject[@""], @"dew": rep.now.dew, @"feelsLike": rep.now.feelsLike, @"humidity": rep.now.humidity,
//                                      @"icon": rep.now.icon,  @"obsTime": rep.now.obsTime, @"precip": rep.now.precip, @"pressure": rep.now.pressure,
//                                      @"temp": rep.now.temp, @"text": rep.now.text, @"vis": rep.now.vis, @"wind360": rep.now.wind360,
//                                      @"windDir": rep.now.windDir, @"windScale": rep.now.windScale, @"windSpeed": rep.now.windSpeed};
//                NSDictionary *refer = @{@"licenseList": rep.refer.license, @"sourcesList": rep.refer.sources};
//                NSDictionary *basic = @{@"fxLink": rep.fxLink, @"updateTime": rep.updateTime};
//        NSMutableDictionary *dic = [NSMutableDictionary new];
//        [dic setValue:responseObject[@"code"] forKey:@"code"];
//        [dic setValue:responseObject[@"now"] forKey:@"now"];
//        [dic setValue:responseObject[@"updateTime"] forKey:@"updateTime"];
//        [dic setValue:responseObject[@"fxLink"] forKey:@"fxLink"];
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:0 error:&error];
        result([[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        result(error);
        NSLog(@"error->%@",error);
    }];
}
@end
