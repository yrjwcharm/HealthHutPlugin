#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import <HealthHutModular/HealthHutHomeVC.h>
@interface AppDelegate()<HealthHutHomeVCDalegate>

@end
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
    FlutterViewController *controller = (FlutterViewController*)self.window.rootViewController;
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.navigationController;
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self.window makeKeyAndVisible];
  // Override point for customization after application launch.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jumpHealthHutModular:) name:@"jumpHealthHutModular" object:nil];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
    
}
-(void)jumpHealthHutModular:(NSNotification*)noti
{
//   跳转原生健康小屋模块
    NSDictionary*dic=noti.userInfo;
    NSString*userId=[dic objectForKey:@"userId"];
    HealthHutHomeVC*nextVC=[[HealthHutHomeVC alloc]init];
    nextVC.delegate=self;
    nextVC.userId=userId;
    [self.navigationController pushViewController:nextVC animated:YES];
}
-(void)goBack
{
//    返回
    [self.navigationController popViewControllerAnimated:YES];
}
@end
