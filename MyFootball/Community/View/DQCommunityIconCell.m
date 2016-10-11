//
//  DQCommunityIconCell.m
//  MyFootball
//
//  Created by huangjinyang on 16/10/9.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQCommunityIconCell.h"
#define IMAGEW (UIScreenWidth-30)/8
@implementation DQCommunityIconCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.contentView.backgroundColor=[UIColor whiteColor];
        [self createUI];
    }
    
    return self;
}

-(void)createUI{
    UIImageView* imageView=[UIImageView new];
    UILabel* titleLabel=[UILabel new];
    UILabel* followingLabel=[UILabel new];
    UILabel* topicLabel=[UILabel new];
    
    titleLabel.font=[UIFont systemFontOfSize:14];
    followingLabel.font=[UIFont systemFontOfSize:12];
    topicLabel.font=[UIFont systemFontOfSize:12];
    
    self.iconImage=imageView;
    self.titleLabel=titleLabel;
    self.followingLabel=followingLabel;
    self.topicLabel=topicLabel;
    
    [self.contentView addSubview:self.iconImage];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.followingLabel];
    [self.contentView addSubview:self.topicLabel];
    
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(10);
        make.size.mas_equalTo(CGSizeMake(IMAGEW, IMAGEW));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.contentView);
        make.bottom.equalTo(self.followingLabel.mas_top).offset(-5);
        make.left.equalTo(self.iconImage.mas_right).offset(10);
    }];
    
    [self.followingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.centerY.equalTo(self.iconImage);
    }];
    
    [self.topicLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.followingLabel.mas_bottom).offset(5);
    }];
    
}

-(void)configWithModel:(DQCommunitySingleModel* )model{
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:model.thumb] placeholderImage:IMAGENAME(@"2016")];
    self.titleLabel.text=model.title;
    self.followingLabel.text=[NSString stringWithFormat:@"关注%zd",model.join_user_total];
    self.topicLabel.text=[NSString stringWithFormat:@"帖子%zd",model.topic_total];
}

@end
