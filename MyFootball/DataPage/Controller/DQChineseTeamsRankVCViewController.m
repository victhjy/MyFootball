//
//  DQChineseTeamsRankVCViewController.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/11.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQChineseTeamsRankVCViewController.h"
#import "DQDataTeamsRankModel.h"
#import "DQDataNormalLeagueRankCell.h"
@interface DQChineseTeamsRankVCViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UISegmentedControl* segment;
@property(nonatomic,strong)DQDataTeamsRankModel* teamsModel;
@property(nonatomic,strong)NSArray* teamsRankArr;
@end

@implementation DQChineseTeamsRankVCViewController
{
    UITableView* _tableView;
}
static NSString * reuseCell=@"normalLeagueCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[MyTools colorWithHexString:@"0x4b4b4b"];
    
    [self configSegment];
    [self configTableView];
    
    [self loadDataWithType:0 andLeague:@"51"];
       // Do any additional setup after loading the view.
}

-(void)configTableView{
    _tableView=[UITableView new];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    _tableView.tableFooterView=[UIView new];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.segment.mas_bottom).offset(10);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.mas_bottomLayoutGuideTop);
    }];
    [_tableView registerClass:[DQDataNormalLeagueRankCell class] forCellReuseIdentifier:reuseCell];
}

-(void)configSegment{
    self.segment.tintColor = [MyTools colorWithHexString:@"0x2d2d2d"];
    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:14],
                                             NSForegroundColorAttributeName: [UIColor whiteColor]};
    [self.segment setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];//设置文字属性
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:14],
                                               NSForegroundColorAttributeName: [UIColor lightTextColor]};
    [self.segment setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    self.segment.selectedSegmentIndex=0;

}

#pragma mark - Request

-(void)loadDataWithType:(NSInteger) type andLeague:(NSString* )league{
    NSDictionary* paramDic=[NSDictionary new];
    NSString* path;
    switch (type) {
        case 0:
            path=APIGetDataTeamRanking;
            break;
        case 1:
            path=APIGetDataGoalRanking;
            break;
        case 2:
            path=APIGetDataAssistRanking;
            break;
        case 3:
            path=APIGetDataGameRanking;
            break;

        default:
            break;
    }
    //league51 为中超
    NSString* pathAndLeague=[NSString stringWithFormat:@"%@%@",path,league];
    paramDic=@{
               @"season_id":@"",
               };
    [[DQAFNetManager sharedManager]requestWithMethod:GET WithPath:pathAndLeague WithParams:paramDic WithSuccessBlock:^(NSDictionary *dic) {
        if (dic) {
            NSArray* resultArr=(NSArray* )dic;
            NSDictionary* resultDic=resultArr[0];
            self.teamsModel=[DQDataTeamsRankModel mj_objectWithKeyValues:resultDic];
            self.teamsRankArr=[DQDataSingleTeamModel mj_objectArrayWithKeyValuesArray:self.teamsModel.rankings];
            [_tableView reloadData];
        }
    } WithFailurBlock:^(NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        }
    }];
}

#pragma mark - TableView Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.teamsRankArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 25;
}
-(UIView* )tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView* bgView=[UIView new];
    bgView.backgroundColor=[UIColor whiteColor];
    UILabel* teamLabel=[UILabel new];
    UILabel* gameLabel=[UILabel new];
    UILabel* winLabel=[UILabel new];
    UILabel* drawLabel=[UILabel new];
    UILabel* defeatLabel=[UILabel new];
    UILabel* goalsLabel=[UILabel new];
    UILabel* scoreLabel=[UILabel new];
    CGFloat padding=10;
    UIFont* font=[UIFont systemFontOfSize:13];
    teamLabel.font=font;
    gameLabel.font=font;
    winLabel.font=font;
    drawLabel.font=font;
    defeatLabel.font=font;
    goalsLabel.font=font;
    scoreLabel.font=font;
    
    
    [bgView addSubview:teamLabel];
    [bgView addSubview:gameLabel];
    [bgView addSubview:winLabel];
    [bgView addSubview:drawLabel];
    [bgView addSubview:defeatLabel];
    [bgView addSubview:goalsLabel];
    [bgView addSubview:scoreLabel];
    
   
    teamLabel.text=@"球队";
    [teamLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(40);
        make.centerY.equalTo(bgView);
    }];
    
    gameLabel.text=@"赛";
    [gameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(teamLabel.mas_centerY);
        make.centerX.equalTo(bgView.mas_centerX).offset(-5);
    }];
    
    winLabel.text=@"胜";
    [winLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(gameLabel.mas_right).offset(UIScreenWidth/22);
        make.centerY.equalTo(teamLabel);
    }];
    
    drawLabel.text=@"平";
    [drawLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(teamLabel);
        make.left.equalTo(winLabel.mas_right).offset(UIScreenWidth/22);
    }];
    
    defeatLabel.text=@"负";
    [defeatLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(teamLabel);
        make.left.equalTo(drawLabel.mas_right).offset(UIScreenWidth/22);
    }];
    
    goalsLabel.text=@"进/失";
    [goalsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(teamLabel);
//        make.right.equalTo(scoreLabel.mas_left).offset(-padding);
        make.left.equalTo(defeatLabel.mas_right).offset(UIScreenWidth/22);
    }];
    
    scoreLabel.text=@"积分";
    [scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(teamLabel);
        make.right.equalTo(bgView).offset(-padding);
    }];
    
    
    return bgView;
}

-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DQDataSingleTeamModel* model=self.teamsRankArr[indexPath.row];
    DQDataNormalLeagueRankCell* cell=[tableView dequeueReusableCellWithIdentifier:reuseCell];
    [cell configWithModel:model];
    return cell;
}

#pragma mark - getter&&setter

-(UISegmentedControl* )segment{
    if (!_segment) {
        _segment=[[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"积分",@"射手",@"助攻",@"赛程", nil]];
        [self.view addSubview:_segment];
        [_segment mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.view).offset(10);
            make.right.equalTo(self.view).offset(-10);
            make.height.mas_offset(30);
        }];
    }
    return _segment;
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
