//
//  DQCommunityIconCell.h
//  MyFootball
//
//  Created by huangjinyang on 16/10/9.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DQCommunityModel.h"
@interface DQCommunityIconCell : UICollectionViewCell

@property(nonatomic,strong)UIImageView* iconImage;
@property(nonatomic,strong)UILabel* titleLabel;
@property(nonatomic,strong)UILabel* followingLabel;
@property(nonatomic,strong)UILabel* topicLabel;

-(void)configWithModel:(DQCommunitySingleModel* )model;

@end
