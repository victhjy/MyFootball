//
//  FootballDataVC.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/2.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "FootballDataVC.h"
#import "DQChineseTeamsRankVCViewController.h"
@interface FootballDataVC ()<LSYViewPagerVCDataSource,LSYViewPagerVCDelegate>
@property(nonatomic,strong)NSArray* controllersArr;
@property(nonatomic,strong)NSArray* titlesArr;
@end

@implementation FootballDataVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupControllers];
    self.delegate=self;
    self.dataSource=self;
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
}

-(void)setupControllers{
    DQChineseTeamsRankVCViewController* chineseTeamRank=[[DQChineseTeamsRankVCViewController alloc]init];
    chineseTeamRank.leagueNumber=@"51";
    DQChineseTeamsRankVCViewController* shipVC=[[DQChineseTeamsRankVCViewController alloc]init];
    shipVC.leagueNumber=@"8";
    DQChineseTeamsRankVCViewController* chineseTeamVC=[[DQChineseTeamsRankVCViewController alloc]init];
    chineseTeamVC.leagueNumber=@"7";
    _controllersArr=@[chineseTeamRank,shipVC,chineseTeamVC];
    
    _titlesArr=@[@"中超",@"英超",@"西甲"];
}

#pragma mark - ViewPager 代理方法实现

-(NSInteger)numberOfViewControllersInViewPager:(LSYViewPagerVC *)viewPager
{
    //返回要实现滚动效果的控制器数量
    return 3;
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
