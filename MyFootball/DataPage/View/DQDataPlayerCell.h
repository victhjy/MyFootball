//
//  DQDataPlayerCell.h
//  MyFootball
//
//  Created by huangjinyang on 16/9/18.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DQDataTeamsRankModel.h"
@interface DQDataPlayerCell : UITableViewCell
@property(nonatomic,strong)UILabel* rankLabel;
@property(nonatomic,strong)UILabel* nameLabel;
@property(nonatomic,strong)UIImageView* teamImage;
@property(nonatomic,strong)UILabel* teamLabel;
@property(nonatomic,strong)UILabel* count;

@property(nonatomic,assign)BOOL topPlayer;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

-(void)configWithModel:(DQDataPlayerRankModel*)model;
@end
