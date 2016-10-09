//
//  DQDataTeamScheduleCell.h
//  MyFootball
//
//  Created by huangjinyang on 16/10/8.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DQDataTeamsRankModel.h"
@interface DQDataTeamScheduleCell : UITableViewCell

@property(nonatomic,strong)UILabel* timeLabel;
@property(nonatomic,strong)UILabel* teamLabelA;
@property(nonatomic,strong)UILabel* teamLabelB;
@property(nonatomic,strong)UIImageView* teamAImage;
@property(nonatomic,strong)UIImageView* teamBImage;
@property(nonatomic,strong)UILabel* VS;

-(void)configWithModel:(DQDataScheduleModel* )model;

@end
