//
//  DQDataNormalLeagueRankCell.h
//  MyFootball
//
//  Created by huangjinyang on 16/9/12.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DQDataTeamsRankModel.h"
@interface DQDataNormalLeagueRankCell : UITableViewCell
@property(nonatomic,strong)UILabel* rankLabel;
@property(nonatomic,strong)UIImageView* teamImage;
@property(nonatomic,strong)UILabel* teamNameLabel;
@property(nonatomic,strong)UILabel* gamesLabel;
@property(nonatomic,strong)UILabel* winLabel;
@property(nonatomic,strong)UILabel* drawLabel;
@property(nonatomic,strong)UILabel* defeatLabel;
@property(nonatomic,strong)UILabel* goalsLabel;
@property(nonatomic,strong)UILabel* scoreLabel;

@property(nonatomic,assign)BOOL colorFlag;
-(void)configWithModel:(DQDataSingleTeamModel* )model;
@end
