//
//  DQDataPlayerCell.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/18.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQDataPlayerCell.h"

@implementation DQDataPlayerCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    UILabel* rank=[UILabel new];
    self.rankLabel=rank;
    
    UILabel* namelabel=[UILabel new];
    self.nameLabel=namelabel;
    
    UIImageView* imageView=[UIImageView new];
    self.teamImage=imageView;
    
    UILabel* teamName=[UILabel new];
    self.teamLabel=teamName;
    
    UILabel* countlabel=[UILabel new];
    self.count=countlabel;
    
    self.rankLabel.font=[UIFont systemFontOfSize:12];
    self.nameLabel.font=self.rankLabel.font;
    self.teamLabel.font=self.rankLabel.font;
    self.count.font=self.rankLabel.font;
    
    [self.contentView addSubview:self.rankLabel];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.teamLabel];
    [self.contentView addSubview:self.teamImage];
    [self.contentView addSubview:self.count];
    
    [self.rankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(10);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rankLabel).offset(20);
        make.centerY.equalTo(self.rankLabel);
    }];
    
    [self.teamImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.rankLabel);
        make.centerX.equalTo(self.contentView).offset(-10);
        make.size.mas_equalTo(CGSizeMake(25, 25));
    }];
    
    [self.teamLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.teamImage.mas_right).offset(10);
        make.centerY.equalTo(self.rankLabel);
    }];
    
    [self.count mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-15);
        make.centerY.equalTo(self.rankLabel);
    }];
}
-(void)configWithModel:(DQDataPlayerRankModel*)model{
    self.rankLabel.text=model.rank;
    self.nameLabel.text=model.name;
    self.teamLabel.text=model.team_name;
    self.teamImage.image=[UIImage imageNamed:@"2016"];
    self.count.text=model.count;
}

@end
