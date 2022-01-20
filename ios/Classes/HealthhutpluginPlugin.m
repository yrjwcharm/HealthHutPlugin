#import "HealthhutpluginPlugin.h"

@implementation HealthhutpluginPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"healthhutplugin"
            binaryMessenger:[registrar messenger]];
  HealthhutpluginPlugin* instance = [[HealthhutpluginPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
    

}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"jumpHealthHutModular" isEqualToString:call.method]) {
      id para=call.arguments;
      NSDictionary*dic=[self dictionaryWithJsonString:para];

      [[NSNotificationCenter defaultCenter] postNotificationName:@"jumpHealthHutModular" object:nil userInfo:dic];

      

  } else {
    result(FlutterMethodNotImplemented);
  }

}

- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }

    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end
