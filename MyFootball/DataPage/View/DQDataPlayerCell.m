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
        self.contentView.backgroundColor=DATACELLBGCOLOR;
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
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [self.teamLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.teamImage.mas_right).offset(10);
        make.centerY.equalTo(self.rankLabel);
    }];
    [self.count mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_right).offset(-25);
        make.centerY.equalTo(self.rankLabel);
    }];
    
    self.rankLabel.textColor=[UIColor whiteColor];
    self.nameLabel.textColor=self.rankLabel.textColor;
    self.teamLabel.textColor=self.rankLabel.textColor;
    self.count.textColor=self.rankLabel.textColor;
    
    UILabel* line=[UILabel new];
    line.backgroundColor=[MyTools colorWithHexString:@"0x454545"];
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
    }];
}
-(void)configWithModel:(DQDataPlayerRankModel*)model{
    self.rankLabel.text=model.rank;
    self.nameLabel.text=model.name;
    self.teamLabel.text=model.team_name;
    [self.teamImage sd_setImageWithURL:[NSURL URLWithString:TEAMIMAGE(model.team_id)] placeholderImage:IMAGENAME(@"2016")];
    self.count.text=model.count;
    if (self.topPlayer) {
        self.contentView.backgroundColor=ThemeColor;
    }
    else{
        self.contentView.backgroundColor=[MyTools colorWithHexString:@"0x4b4b4b"];
    }
}

-(void)prepareForReuse{
    self.topPlayer=nil;
}

@end
