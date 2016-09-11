//
//  DQChineseTeamCell.h
//  MyFootball
//
//  Created by huangjinyang on 16/9/7.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DQChineseTeamModel.h"
@interface DQChineseTeamCell : UITableViewCell
@property(nonatomic,strong)UILabel* title;
@property(nonatomic,strong)UILabel* detail;
@property(nonatomic,strong)UIImageView* imageViewLeft;
@property(nonatomic,strong)UIImageView* commentIcon;
@property(nonatomic,strong)UILabel* commentLabel;
@property(nonatomic,strong)UILabel* label;

@property(nonatomic,strong)UILabel* topLabel;

-(void)configWithModel:(DQChineseTeamListModel* )model;
-(CGFloat)heightForCell;
@end
