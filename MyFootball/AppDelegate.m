//
//  AppDelegate.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/2.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "AppDelegate.h"
#import "DQMainTabBarController.h"
#import "AFNetWorking.h"
#import <Bugly/Bugly.h>
#import <LocalAuthentication/LocalAuthentication.h>
#import "DQNewsDetailViewController.h"
@import GoogleMobileAds;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //腾讯bugly
//    [Bugly startWithAppId:BuglyAppID];
    
    //JLRouter
    [self registerJLRouters];
    
//    Download the Google Mobile Ads SDK.
//    Follow the SDK integration guide. Specify ad type, size and placement when you integrate the code.
//    App ID: ca-app-pub-5964239870068429~8495304136
//    Ad unit ID: ca-app-pub-5964239870068429/6168523693
    // Initialize Google Mobile Ads SDK
    [GADMobileAds configureWithApplicationID:@"ca-app-pub-5964239870068429~8495304136"];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    [self setupAFN];
    
    [self configNavigationBar];
#if TARGET_IPHONE_SIMULATOR
    NSLog(@"模拟器-跳过验证");
    self.window.rootViewController
    =[DQMainTabBarController new];
    
#else
    [self authenticateUser];
#endif
    
    
    Class Test = NSClassFromString(@"UIDebuggingInformationOverlay");
    [[Test class] performSelector:@selector(prepareDebuggingOverlay)];
//#ifdef DEBUG//因为这个是私有的api，一定要保证上线时的包中不包含这段代码！
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
//    id debugClass = NSClassFromString(@"UIDebuggingInformationOverlay");//获得对象
//    [debugClass performSelector:NSSelectorFromString(@"prepareDebuggingOverlay")];//开启调试模式
//#pragma clang diagnostic pop
//#endif
    
    return YES;
}

-(void)configNavigationBar{
    [[UINavigationBar appearance] setBarTintColor:ThemeColor];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName : [UIColor whiteColor]
                                                           }];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    [[UIBarButtonItem appearance]
     setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
     forBarMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
}

- (void)registerJLRouters {
    __weak __typeof(self)weakSelf = self;
    [JLRoutes addRoute:@"/:cagegary/:itemId" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        NSLog(@"%@",parameters);
//        [weakSelf dealRouterParams:parameters];
        return YES;
    }];

}

- (void)dealRouterParams:(NSDictionary* )param {
//    NSString* categary=param[@"categary"];
//    NSString* itemId=param[@"itemId"];
//    UIViewController *currentVc = [MyTools currentViewController];
//    if ([categary isEqualToString:@"feed"]) {
//        
//    }
//    else if ([categary isEqualToString:@"news"]){
//        DQNewsDetailViewController *vc=[DQNewsDetailViewController new];
////        vc.
//    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [JLRoutes routeURL:url];
}

#pragma mark - setup

- (void)setupAFN {
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
//    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
//    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        // 当网络状态发生改变的时候调用这个block
//        switch (status) {
//            case AFNetworkReachabilityStatusReachableViaWiFi:
//                [MyTools showText:@"wifi" inView:self.window];
//                NSLog(@"WIFI");
//                break;
//                
//            case AFNetworkReachabilityStatusReachableViaWWAN:
//                [MyTools showText:@"移动数据" inView:self.window];
//                NSLog(@"自带网络");
//                break;
//                
//            case AFNetworkReachabilityStatusNotReachable:
//                [MyTools showText:@"没网" inView:self.window];
//                NSLog(@"没有网络");
//                break;
//                
//            case AFNetworkReachabilityStatusUnknown:
//                NSLog(@"未知网络");
//                break;
//            default:
//                break;
//        }
//    }];
//    // 开始监控
//    [mgr startMonitoring];
}

-(void)authenticateUser{
    //创建LAContext
    LAContext *context = [[LAContext alloc] init];
    // 这个属性是设置指纹输入失败之后的弹出框的选项
    context.localizedFallbackTitle = @"请输入密码";
    
    NSError *error = nil;
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        NSLog(@"支持指纹识别");
        // localizedReason: 用于设置提示语，表示为什么要使用Touch ID
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"请按home键指纹解锁" reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                
                dispatch_sync(dispatch_get_main_queue(), ^{
                    // Update UI in UI thread here
                    NSLog(@"验证成功 刷新主界面");
                    
                    self.window.rootViewController
                    =[DQMainTabBarController new];
                });
            }else{
                NSLog(@"%@",error.localizedDescription);
                switch (error.code) {
                    case LAErrorSystemCancel:
                    {
                        NSLog(@"系统取消授权，如其他APP切入");
                        break;
                    }
                    case LAErrorUserCancel:
                    {
                        NSLog(@"用户取消验证Touch ID");
                        break;
                    }
                    case LAErrorAuthenticationFailed:
                    {
                        NSLog(@"授权失败");
                        break;
                    }
                    case LAErrorPasscodeNotSet:
                    {
                        NSLog(@"系统未设置密码");
                        break;
                    }
                    case LAErrorTouchIDNotAvailable:
                    {
                        NSLog(@"设备Touch ID不可用，例如未打开");
                        break;
                    }
                    case LAErrorTouchIDNotEnrolled:
                    {
                        NSLog(@"设备Touch ID不可用，用户未录入");
                        break;
                    }
                    case LAErrorUserFallback: // 用于设置左边的按钮的名称，默认是Enter Password
                    {
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            NSLog(@"用户选择输入密码，切换主线程处理");
                        }];
                        break;
                    }
                    default:
                    {
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                            NSLog(@"其他情况，切换主线程处理");
                        }];
                        break;
                    }
                }
            }
        }];
    }else{
        NSLog(@"不支持指纹识别");
        switch (error.code) {
            case LAErrorTouchIDNotEnrolled:
            {
                NSLog(@"TouchID is not enrolled");
                break;
            }
            case LAErrorPasscodeNotSet:
            {
                NSLog(@"A passcode has not been set");
                break;
            }
            default:
            {
                NSLog(@"TouchID not available");
                break;
            }
        }
        
        NSLog(@"%@",error.localizedDescription);
    }
}

@end
