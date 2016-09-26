//
//  DQChineseTeamGifCell.h
//  MyFootball
//
//  Created by huangjinyang on 16/9/25.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DQGifCellItemView.h"
@interface DQChineseTeamGifCell : UITableViewCell
@property(nonatomic,strong)UILabel* titleLable;
@property(nonatomic,strong)UIScrollView* mainScrollView;
//@property(nonatomic,strong)DQGifCellItemView* itemView;
@property(nonatomic,strong)NSMutableArray* itemViewArr;
@property(nonatomic,strong)NSMutableArray* itemModelArr;

-(void)configViewWithModel:(DQChineseTeamListModel* )model;

@end
