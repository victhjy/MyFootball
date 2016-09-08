//
//  DQCommentCell.h
//  MyFootball
//
//  Created by huangjinyang on 16/9/8.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DQCommentModel.h"

@interface DQCommentCell : UITableViewCell
@property(nonatomic,strong)UIImageView* userPic;
@property(nonatomic,strong)UILabel* userName;
@property(nonatomic,strong)UIImageView* likedTeamPic;
@property(nonatomic,strong)UILabel* time;

@property(nonatomic,strong)UILabel* likedCount;
@property(nonatomic,strong)UIImageView* like;
@property(nonatomic,strong)UILabel* commentDetail;

@property(nonatomic,strong)UIView* recommentBG;
@property(nonatomic,strong)UILabel* recommentUserName;
@property(nonatomic,strong)UILabel* recommentDetail;

-(void)configWithModel:(DQSingleCommentModel* )model;
-(CGFloat)heightForCell;
@end
