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
@interface DQMainTabBarController ()

@end

@implementation DQMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTabBars];
    // Do any additional setup after loading the view.
}

-(void)createTabBars{
    UINavigationController* hotNewsNav=[[UINavigationController alloc]initWithRootViewController:[HotNewsVC new]];
    hotNewsNav.tabBarItem.title=@"首页";
    hotNewsNav.tabBarItem.selectedImage=[IMAGENAME(@"news_press")imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    hotNewsNav.tabBarItem.image=[IMAGENAME(@"news_normal")imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController* liveNav=[[UINavigationController alloc]initWithRootViewController:[ImportantLive new]];
    liveNav.tabBarItem.title=@"直播";
    liveNav.tabBarItem.selectedImage=[IMAGENAME(@"game_press")imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    liveNav.tabBarItem.image=[IMAGENAME(@"game_normal")imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController* lovedCommunityNav=[[UINavigationController alloc]initWithRootViewController:[LovedCommunityVC new]];
    lovedCommunityNav.tabBarItem.image=[IMAGENAME(@"2016")imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    lovedCommunityNav.tabBarItem.selectedImage=[IMAGENAME(@"2016")imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController* allCommunitiesNav=[[UINavigationController alloc]initWithRootViewController:[DQCommunityHomeVC new]];
    allCommunitiesNav.tabBarItem.title=@"圈子";
    allCommunitiesNav.tabBarItem.selectedImage=[IMAGENAME(@"circle_press")imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    allCommunitiesNav.tabBarItem.image=[IMAGENAME(@"circle_normal")imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UINavigationController* footballDataNav=[[UINavigationController alloc]initWithRootViewController:[FootballDataVC new]];
    footballDataNav.tabBarItem.title=@"数据";
    footballDataNav.tabBarItem.image=[IMAGENAME(@"data_normal")imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    footballDataNav.tabBarItem.selectedImage=[IMAGENAME(@"data_press")imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.viewControllers=@[hotNewsNav,liveNav,lovedCommunityNav,allCommunitiesNav,footballDataNav];
    self.tabBar.tintColor=ThemeColor;
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
