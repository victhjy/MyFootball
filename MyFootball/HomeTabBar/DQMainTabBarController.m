//
//  DQMainTabBarController.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/5.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQMainTabBarController.h"
#import "HotNewsVC.h"
#import "ImportantLive.h"
#import "LovedCommunityVC.h"
#import "DQCommunityHomeVC.h"
#import "FootballDataVC.h"
#import "DHGuidePageHUD.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface DQMainTabBarController ()

@end

@implementation DQMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tabBar.hidden=YES;
//    [self setupViewControllers];
//    [self createTabBarsNew];
    [self normalLoad];
        // Do any additional setup after loading the view.
}

- (void)setupViewControllers {
    HotNewsVC* homeVC=[HotNewsVC new];
    ImportantLive* liveVC=[ImportantLive new];
    LovedCommunityVC* lovedVC=[LovedCommunityVC new];
    DQCommunityHomeVC* allCommunityVC=[DQCommunityHomeVC new];
    FootballDataVC* dataVC=[FootballDataVC new];
    
    self.viewControllers=@[homeVC,liveVC,lovedVC,allCommunityVC,dataVC];
}

- (void)createTabBarsNew {
    NSArray* normalImages=@[@"news_normal",@"game_normal",@"2016",@"circle_normal",@"data_normal"];
    NSArray* selectedImages=@[@"news_press",@"game_press",@"2016",@"circle_press",@"data_press"];
    
    UIImageView* tabbar=[[UIImageView alloc]initWithFrame:self.tabBar.frame];
    tabbar.backgroundColor=[UIColor clearColor];
    tabbar.userInteractionEnabled=YES;
}



-(void)normalLoad{
    [self createTabBars];
    if (![[NSUserDefaults standardUserDefaults] boolForKey:BOOLFORKEY]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:BOOLFORKEY];
        //        [[UIApplication sharedApplication] setStatusBarHidden:YES];
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
        // 静态引导页
        [self setStaticGuidePage];
        
        // 动态引导页
        // [self setDynamicGuidePage];
        
        // 视频引导页
        // [self setVideoGuidePage];
        
    }
}

#pragma mark - 设置APP静态图片引导页
- (void)setStaticGuidePage {
    NSArray *imageNameArray = @[@"guideImage1.jpg",@"guideImage2.jpg",@"guideImage3.jpg",@"guideImage4.jpg",@"guideImage5.jpg"];
    DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.view.frame imageNameArray:imageNameArray buttonIsHidden:YES];
    guidePage.slideInto = YES;
    [self.view addSubview:guidePage];
}

#pragma mark - 设置APP动态图片引导页
- (void)setDynamicGuidePage {
    NSArray *imageNameArray = @[@"guideImage6.gif",@"guideImage7.gif",@"guideImage8.gif"];
    DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.view.frame imageNameArray:imageNameArray buttonIsHidden:YES];
    guidePage.slideInto = YES;
    [self.navigationController.view addSubview:guidePage];
}

#pragma mark - 设置APP视频引导页
- (void)setVideoGuidePage {
    NSURL *videoURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"guideMovie1" ofType:@"mov"]];
    DHGuidePageHUD *guidePage = [[DHGuidePageHUD alloc] dh_initWithFrame:self.view.bounds videoURL:videoURL];
    [self.navigationController.view addSubview:guidePage];
}


-(void)createTabBars{
    UINavigationController* hotNewsNav=[[UINavigationController alloc]initWithRootViewController:[HotNewsVC new]];
    hotNewsNav.tabBarItem.title=@"首页";
    hotNewsNav.fd_interactivePopDisabled=YES;
    hotNewsNav.tabBarItem.selectedImage=[IMAGENAME(@"news_press")imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    hotNewsNav.tabBarItem.image=[IMAGENAME(@"news_normal")imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController* liveNav=[[UINavigationController alloc]initWithRootViewController:[ImportantLive new]];
    liveNav.tabBarItem.title=@"直播";
    liveNav.fd_interactivePopDisabled=YES;
    liveNav.tabBarItem.selectedImage=[IMAGENAME(@"game_press")imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    liveNav.tabBarItem.image=[IMAGENAME(@"game_normal")imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController* lovedCommunityNav=[[UINavigationController alloc]initWithRootViewController:[LovedCommunityVC new]];
    lovedCommunityNav.tabBarItem.image=[IMAGENAME(@"2016")imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    lovedCommunityNav.fd_interactivePopDisabled=YES;
    lovedCommunityNav.tabBarItem.imageInsets=UIEdgeInsetsMake(10, 5, 2, 5);
    lovedCommunityNav.tabBarItem.selectedImage=[IMAGENAME(@"2016")imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController* allCommunitiesNav=[[UINavigationController alloc]initWithRootViewController:[DQCommunityHomeVC new]];
    allCommunitiesNav.tabBarItem.title=@"圈子";
    allCommunitiesNav.fd_interactivePopDisabled=YES;
    allCommunitiesNav.tabBarItem.selectedImage=[IMAGENAME(@"circle_press")imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    allCommunitiesNav.tabBarItem.image=[IMAGENAME(@"circle_normal")imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController* footballDataNav=[[UINavigationController alloc]initWithRootViewController:[FootballDataVC new]];
    footballDataNav.tabBarItem.title=@"数据";
    footballDataNav.fd_interactivePopDisabled=YES;
    footballDataNav.tabBarItem.image=[IMAGENAME(@"data_normal")imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    footballDataNav.tabBarItem.selectedImage=[IMAGENAME(@"data_press")imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.viewControllers=@[hotNewsNav,liveNav,lovedCommunityNav,allCommunitiesNav,footballDataNav];
    self.tabBar.tintColor=ThemeColor;
}


// 验证指纹
- (void)authenticateUser {
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

-(void)tapTabBar{
    DQLog(@"tabBar");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
