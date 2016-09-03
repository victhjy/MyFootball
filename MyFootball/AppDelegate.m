//
//  AppDelegate.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/2.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "AppDelegate.h"
#import "HotNewsVC.h"
#import "ImportantLive.h"
#import "LovedCommunityVC.h"
#import "AllCommunitiesVC.h"
#import "FootballDataVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UINavigationController* hotNewsNav=[[UINavigationController alloc]initWithRootViewController:[HotNewsVC new]];
    hotNewsNav.tabBarItem.title=@"首页";
    hotNewsNav.tabBarItem.selectedImage=IMAGENAME(@"news_press");
    hotNewsNav.tabBarItem.image=[IMAGENAME(@"news_normal") imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    UINavigationController* liveNav=[[UINavigationController alloc]initWithRootViewController:[ImportantLive new]];
    liveNav.tabBarItem.title=@"直播";
    liveNav.tabBarItem.selectedImage=IMAGENAME(@"game_press");
    liveNav.tabBarItem.image=IMAGENAME(@"game_normal");
    
    UINavigationController* lovedCommunityNav=[[UINavigationController alloc]initWithRootViewController:[LovedCommunityVC new]];
    lovedCommunityNav.tabBarItem.title=@"皇马";
    lovedCommunityNav.tabBarItem.image=IMAGENAME(@"2016");
    lovedCommunityNav.tabBarItem.selectedImage=IMAGENAME(@"2016");
    
    UINavigationController* allCommunitiesNav=[[UINavigationController alloc]initWithRootViewController:[HotNewsVC new]];
    allCommunitiesNav.tabBarItem.title=@"圈子";
    allCommunitiesNav.tabBarItem.selectedImage=IMAGENAME(@"circle_press");
    allCommunitiesNav.tabBarItem.image=IMAGENAME(@"circle_normal");
    
    UINavigationController* footballDataNav=[[UINavigationController alloc]initWithRootViewController:[FootballDataVC new]];
    footballDataNav.tabBarItem.title=@"数据";
    footballDataNav.tabBarItem.image=IMAGENAME(@"data_normal");
    footballDataNav.tabBarItem.selectedImage=IMAGENAME(@"data_press");
    
    UITabBarController* mainTabBar=[[UITabBarController alloc]init];
    mainTabBar.viewControllers=@[hotNewsNav,liveNav,lovedCommunityNav,allCommunitiesNav,footballDataNav];
    mainTabBar.tabBar.tintColor=ThemeColor;
    
    self.window.rootViewController
    =mainTabBar;
    return YES;
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
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
