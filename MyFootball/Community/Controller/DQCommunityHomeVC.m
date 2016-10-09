//
//  DQCommunityHomeVC.m
//  MyFootball
//
//  Created by huangjinyang on 16/10/9.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQCommunityHomeVC.h"
#import "AllCommunitiesVC.h"
#import "DQCommunityHotTopicVC.h"

@interface DQCommunityHomeVC ()<LSYViewPagerVCDataSource,LSYViewPagerVCDelegate>
@property(nonatomic,strong)NSArray* controllersArr;
@property(nonatomic,strong)NSArray* titlesArr;
@end

@implementation DQCommunityHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupControllers];
    self.delegate=self;
    self.dataSource=self;
    
    self.navigationItem.title=@"圈子";
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
}

-(void)setupControllers{
    AllCommunitiesVC* allCommunities=[[AllCommunitiesVC alloc]init];
    DQCommunityHotTopicVC* hotTopic=[[DQCommunityHotTopicVC alloc]init];
    _controllersArr=@[allCommunities,hotTopic];
    
    _titlesArr=@[@"圈子",@"热帖"];
}

#pragma mark - ViewPager 代理方法实现

-(NSInteger)numberOfViewControllersInViewPager:(LSYViewPagerVC *)viewPager
{
    //返回要实现滚动效果的控制器数量
    return 2;
}

-(UIViewController *)viewPager:(LSYViewPagerVC *)viewPager indexOfViewControllers:(NSInteger)index
{
    
    return _controllersArr[index];
}

-(NSString *)viewPager:(LSYViewPagerVC *)viewPager titleWithIndexOfViewControllers:(NSInteger)index
{
    return _titlesArr[index];
}

-(CGFloat)heightForTitleOfViewPager:(LSYViewPagerVC *)viewPager
{
    return 30;
}

#pragma View Pager Delegate
-(void)viewPagerViewController:(LSYViewPagerVC *)viewPager willScrollerWithCurrentViewController:(UIViewController *)ViewController
{
    
}
-(void)viewPagerViewController:(LSYViewPagerVC *)viewPager didFinishScrollWithCurrentViewController:(UIViewController *)viewController
{
    
}


@end
