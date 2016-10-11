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
#import "DQDataPlayerCell.h"
#import "DQDataTeamScheduleCell.h"
#import "DQDataTeamDetailVC.h"
@interface DQChineseTeamsRankVCViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UISegmentedControl* segment;
@property(nonatomic,strong)DQDataTeamsRankModel* teamsModel;
@property(nonatomic,strong)NSArray* teamsRankArr;
@property(nonatomic,strong)NSMutableDictionary* roundingDic;
@end

@implementation DQChineseTeamsRankVCViewController
{
    UITableView* _tableView;
}
static NSString * reuseCell=@"normalLeagueCell";
static NSString * reuseTopCell=@"topLeagueCell";
static NSString* reusePlayerCell=@"playerCell";
static NSString* resuescheduleCell=@"resuescheduleCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[MyTools colorWithHexString:@"0x4b4b4b"];
    
    [self configSegment];
    [self configTableView];
    
    [self loadDataWithType:0 andLeague:self.leagueNumber];
       // Do any additional setup after loading the view.
}

-(void)configTableView{
    _tableView=[UITableView new];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];
    _tableView.tableFooterView=[UIView new];
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.segment.mas_bottom).offset(10);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.mas_bottomLayoutGuideTop);
    }];
    [_tableView registerClass:[DQDataNormalLeagueRankCell class] forCellReuseIdentifier:reuseCell];
    [_tableView registerClass:[DQDataNormalLeagueRankCell class] forCellReuseIdentifier:reuseTopCell];
    [_tableView registerClass:[DQDataPlayerCell class] forCellReuseIdentifier:reusePlayerCell];
    [_tableView registerClass:[DQDataTeamScheduleCell class] forCellReuseIdentifier:resuescheduleCell];
    __weak typeof(self) weaself=self;
    _tableView.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weaself loadDataWithType:weaself.segment.selectedSegmentIndex andLeague:self.leagueNumber];
    }];
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
    __block NSDictionary* paramDic=[NSDictionary new];
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
            path=APIGetDataGameSchedule;
            break;

        default:
            break;
    }
    //league 51 为中超   8 为英超
    NSString* pathAndLeague=[NSString stringWithFormat:@"%@%@",path,league];
    if (type==3) {
        NSString *absolteUrl=[NSString stringWithFormat:@"%@%@",APIGetDataTeamRounding,self.leagueNumber];
        [[DQAFNetManager sharedManager] requestWithMethod:GET WithPath:absolteUrl WithParams:nil WithSuccessBlock:^(NSDictionary *dic) {
            self.roundingDic=[dic[@"roundList"] firstObject];
            paramDic=@{
                       @"round_id":self.roundingDic[@"round_id"],
                       @"gameweek":self.roundingDic[@"activeNums"]
                       };
            
            [[DQAFNetManager sharedManager]requestWithMethod:GET WithPath:APIGetDataGameSchedule WithParams:paramDic WithSuccessBlock:^(NSDictionary *dic) {
                if (dic) {
                   
                    NSArray* arr=[dic valueForKey:@"matches"];
                    self.teamsRankArr=[DQDataScheduleModel mj_objectArrayWithKeyValuesArray:arr];
                    [_tableView.mj_header endRefreshing];
                    [_tableView reloadData];
                    [_tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
                }
            } WithFailurBlock:^(NSError *error) {
                if (error) {
                    DQLog(@"%@",error);
                }
            }];
            
            

        } WithFailurBlock:^(NSError *error) {
            if (error) {
                DQLog(@"%@",error);
            }
        }];
    }
    else{
        paramDic=@{
                   @"season_id":@"",
                   };
    [[DQAFNetManager sharedManager]requestWithMethod:GET WithPath:pathAndLeague WithParams:paramDic WithSuccessBlock:^(NSDictionary *dic) {
        if (dic) {
            if (type==1){
                NSArray* resultArr=(NSArray* )dic;
                self.teamsRankArr=[DQDataPlayerRankModel mj_objectArrayWithKeyValuesArray:resultArr];
                
            }
            else if(type==0){
                NSArray* resultArr=(NSArray* )dic;
                NSDictionary* resultDic=resultArr[0];
                self.teamsModel=[DQDataTeamsRankModel mj_objectWithKeyValues:resultDic];
                self.teamsRankArr=[DQDataSingleTeamModel mj_objectArrayWithKeyValuesArray:self.teamsModel.rankings];
            }
            else if (type==2){
                NSArray* resultArr=(NSArray* )dic;
                self.teamsRankArr=[DQDataPlayerRankModel mj_objectArrayWithKeyValuesArray:resultArr];
            }
            [_tableView.mj_header endRefreshing];
            [_tableView reloadData];
            [_tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        }
    } WithFailurBlock:^(NSError *error) {
        if (error) {
            DQLog(@"%@",error);
        }
    }];
    }
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
    if (self.segment.selectedSegmentIndex==0) {
        
        UILabel* teamLabel=[UILabel new];
        UILabel* gameLabel=[UILabel new];
        UILabel* winLabel=[UILabel new];
        UILabel* drawLabel=[UILabel new];
        UILabel* defeatLabel=[UILabel new];
        UILabel* goalsLabel=[UILabel new];
        UILabel* scoreLabel=[UILabel new];
//        CGFloat padding=10;
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
            make.centerX.equalTo(gameLabel).offset(UIScreenWidth/12);
            make.centerY.equalTo(teamLabel);
        }];
        
        drawLabel.text=@"平";
        [drawLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(teamLabel);
            make.centerX.equalTo(winLabel).offset(UIScreenWidth/12);
        }];
        
        defeatLabel.text=@"负";
        [defeatLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(teamLabel);
            make.centerX.equalTo(drawLabel).offset(UIScreenWidth/12);
        }];
        
        goalsLabel.text=@"进/失";
        [goalsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(teamLabel);
            make.centerX.equalTo(defeatLabel).offset(UIScreenWidth/9);
        }];
        
        scoreLabel.text=@"积分";
        [scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(teamLabel);
            make.right.equalTo(bgView).offset(-5);
        }];
    }
    else if (self.segment.selectedSegmentIndex==1||self.segment.selectedSegmentIndex==2){
        bgView.backgroundColor=[UIColor whiteColor];
        UILabel* playerLabel=[UILabel new];
        UILabel* rankLabel=[UILabel new];
        UILabel* teamLabel=[UILabel new];
        UIImageView* teamImage=[UIImageView new];
        UILabel* goalsLabel=[UILabel new];

        CGFloat padding=10;
        UIFont* font=[UIFont systemFontOfSize:13];
        playerLabel.font=font;
        teamLabel.font=playerLabel.font;
        rankLabel.font=playerLabel.font;
        goalsLabel.font=playerLabel.font;

        [bgView addSubview:teamLabel];
        [bgView addSubview:playerLabel];
        [bgView addSubview:goalsLabel];
        [bgView addSubview:rankLabel];
        [bgView addSubview:teamImage];
        
        playerLabel.text=@"球员";
        [playerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bgView).offset(40);
            make.centerY.equalTo(bgView);
        }];
        
        teamLabel.text=@"球队";
        [teamLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(playerLabel.mas_centerY);
            make.centerX.equalTo(bgView.mas_centerX).offset(-5);
        }];
        
        goalsLabel.text=self.segment.selectedSegmentIndex-1==0?@"进球":@"助攻";
        [goalsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(playerLabel);
            make.right.equalTo(bgView).offset(-padding*2);
        }];
    }
    else if (self.segment.selectedSegmentIndex==3){
        UILabel* lastRound=[UILabel new];
        UILabel* nextRound=[UILabel new];
        UILabel* nowRound=[UILabel new];
        lastRound.font=[UIFont systemFontOfSize:12];
        nextRound.font=lastRound.font;
        nowRound.font=lastRound.font;
        
        [bgView addSubview:lastRound];
        [bgView addSubview:nowRound];
        [bgView addSubview:nextRound];
        
        lastRound.text=[NSString stringWithFormat:@"上一轮"];
        nextRound.text=[NSString stringWithFormat:@"下一轮"];
        nowRound.text=[NSString stringWithFormat:@"第%@轮",self.roundingDic[@"activeNums"]];
        
        [lastRound mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(bgView);
            make.left.equalTo(bgView).offset(20);
        }];
        [nowRound mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(lastRound);
            make.centerX.equalTo(bgView);
        }];
        [nextRound mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(bgView).offset(-20);
            make.centerY.equalTo(bgView);
        }];
        
        UITapGestureRecognizer *nextGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(nextRounding)];
        UITapGestureRecognizer *lastGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lastRounding)];
        lastRound.userInteractionEnabled=YES;
        nextRound.userInteractionEnabled=YES;
        [lastRound addGestureRecognizer:lastGesture];
        [nextRound addGestureRecognizer:nextGesture];
    }
    
    
    return bgView;
}

-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //积分排行
    if (self.segment.selectedSegmentIndex==0) {
        DQDataSingleTeamModel* model=self.teamsRankArr[indexPath.row];
        DQDataNormalLeagueRankCell* cell;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        if (indexPath.row<3) {
            
            cell=[tableView dequeueReusableCellWithIdentifier:reuseTopCell];
            cell.colorTop=YES;
        }
        else{
            cell=[tableView dequeueReusableCellWithIdentifier:reuseCell];
        }
        
        if (self.teamsRankArr.count-indexPath.row-1<3) {
            cell.colorBottom=YES;
        }
        
        [cell configWithModel:model];
        return cell;

    }
    //进球、助攻排行
    else if(self.segment.selectedSegmentIndex==1||self.segment.selectedSegmentIndex==2){
        DQDataPlayerRankModel* model=self.teamsRankArr[indexPath.row];
        model.rank=[NSString stringWithFormat:@"%zd",indexPath.row+1];
        DQDataPlayerCell* cell=[tableView dequeueReusableCellWithIdentifier:reusePlayerCell];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        if (indexPath.row<3) {
            cell.topPlayer=YES;
        }
        [cell configWithModel:model];
        return cell;
    }
    //赛程
    else{
        DQDataScheduleModel* model=self.teamsRankArr[indexPath.row];
        DQDataTeamScheduleCell* cell=[tableView dequeueReusableCellWithIdentifier:resuescheduleCell];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        [cell configWithModel:model];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];// 取消选中
    
    if (self.segment.selectedSegmentIndex==3) {
        [self gotoTeamDetail];
    }
}

#pragma mark - private method

-(void)lastRounding{
    DQLog(@"上一轮");
}

-(void)nextRounding{
    DQLog(@"下一轮");
}

-(void)gotoTeamDetail{
    DQDataTeamDetailVC* teamDetail=[DQDataTeamDetailVC new];
    [self.navigationController pushViewController:teamDetail animated:YES];
}
#pragma mark - segmentDelegate

-(void)clickedSegment:(UISegmentedControl*)segment{

       [self loadDataWithType:segment.selectedSegmentIndex andLeague:self.leagueNumber];

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
        [_segment addTarget:self action:@selector(clickedSegment:) forControlEvents:UIControlEventValueChanged];
    }
    return _segment;
}
    
-(NSMutableDictionary*)roundingDic
{
    if(!_roundingDic)
    {
        _roundingDic=[NSMutableDictionary new];
    }
    return _roundingDic;
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
