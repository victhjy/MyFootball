//
//  DQGifCellItem.h
//  MyFootball
//
//  Created by huangjinyang on 16/9/26.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DQChineseTeamModel.h"

@interface DQGifCellItemView : UIView
@property(nonatomic,strong)UILabel* itemTitle;
@property(nonatomic,strong)UIImageView* imageView;
@property(nonatomic,strong)UILabel* timeLabel;
@property(nonatomic,strong)UILabel* commentCount;

-(void)configWithItemModel:(DQChineseTeamSubItemModel* )itemModel;

@end
