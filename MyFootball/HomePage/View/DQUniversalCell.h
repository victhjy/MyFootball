//
//  DQUniversalCell.h
//  MyFootball
//
//  Created by jinx huang on 17/5/1.
//  Copyright © 2017年 huangjinyang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DQHotNewsSingleItem;
@interface DQUniversalCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title_lbl;
@property (weak, nonatomic) IBOutlet UILabel *context_lbl;
@property (weak, nonatomic) IBOutlet UILabel *comment_lbl;
@property (weak, nonatomic) IBOutlet UILabel *right_lbl;
@property (weak, nonatomic) IBOutlet UILabel *left_lbl;
@property (weak, nonatomic) IBOutlet UIImageView *contentImage;


-(void)bindData:(DQHotNewsSingleItem* )item;
@end
