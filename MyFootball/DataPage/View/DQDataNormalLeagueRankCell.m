//
//  DQDataNormalLeagueRankCell.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/12.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQDataNormalLeagueRankCell.h"

@implementation DQDataNormalLeagueRankCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    self.contentView.backgroundColor=[MyTools colorWithHexString:@"0x4b4b4b"];
    CGFloat padding=10;
    self.rankLabel=[UILabel new];
    self.teamImage=[UIImageView new];
    self.teamNameLabel=[UILabel new];
    self.gamesLabel=[UILabel new];
    self.winLabel=[UILabel new];
    self.drawLabel=[UILabel new];
    self.defeatLabel=[UILabel new];
    self.goalsLabel=[UILabel new];
    self.scoreLabel=[UILabel new];
    
    self.rankLabel.textColor=[UIColor whiteColor];
    self.teamNameLabel.textColor=self.rankLabel.textColor;
    self.gamesLabel.textColor=self.rankLabel.textColor;
    self.winLabel.textColor=self.rankLabel.textColor;
    self.drawLabel.textColor=self.rankLabel.textColor;
    self.defeatLabel.textColor=self.rankLabel.textColor;
    self.goalsLabel.textColor=self.rankLabel.textColor;
    self.scoreLabel.textColor=self.rankLabel.textColor;
    
    self.rankLabel.font=[UIFont systemFontOfSize:12];
    self.teamNameLabel.font=self.rankLabel.font;
    self.gamesLabel.font=self.rankLabel.font;
    self.gamesLabel.font=self.rankLabel.font;
    self.winLabel.font=self.rankLabel.font;
    self.drawLabel.font=self.rankLabel.font;
    self.defeatLabel.font=self.rankLabel.font;
    self.goalsLabel.font=self.rankLabel.font;
    self.scoreLabel.font=self.rankLabel.font;
    
    [self.contentView addSubview:self.rankLabel];
    [self.contentView addSubview:self.teamImage];
    [self.contentView addSubview:self.teamNameLabel];
    [self.contentView addSubview:self.gamesLabel];
    [self.contentView addSubview:self.winLabel];
    [self.contentView addSubview:self.drawLabel];
    [self.contentView addSubview:self.defeatLabel];
    [self.contentView addSubview:self.goalsLabel];
    [self.contentView addSubview:self.scoreLabel];
    
    [self.rankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(padding);
    }];
    [self.teamImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.rankLabel);
        make.left.equalTo(self.rankLabel.mas_right).offset(padding);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [self.teamNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.rankLabel);
        make.left.equalTo(self.teamImage.mas_right).offset(padding);
    }];
    [self.gamesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.rankLabel);
         make.centerX.equalTo(self.contentView).offset(-5);
    }];
    
    [self.winLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.gamesLabel.mas_right).offset(UIScreenWidth/22);
        make.centerY.equalTo(self.rankLabel);
    }];
    
    [self.drawLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.rankLabel);
        make.left.equalTo(self.winLabel.mas_right).offset(UIScreenWidth/22);
    }];
    
    [self.defeatLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.rankLabel);
        make.left.equalTo(self.drawLabel.mas_right).offset(UIScreenWidth/22);
    }];
    
    [self.goalsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.rankLabel);
        //        make.right.equalTo(scoreLabel.mas_left).offset(-padding);
        make.left.equalTo(self.defeatLabel.mas_right).offset(UIScreenWidth/22);
    }];
    
    [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.rankLabel);
        make.right.equalTo(self.contentView).offset(-padding);
    }];

}

-(void)configWithModel:(DQDataSingleTeamModel* )model{
    self.rankLabel.text=model.rank;
    self.teamImage.image=IMAGENAME(@"2016");
    self.teamNameLabel.text=model.club_name;
    self.gamesLabel.text=model.matches_total;
    self.winLabel.text=model.matches_won;
    self.drawLabel.text=model.matches_draw;
    self.defeatLabel.text=model.matches_lost;
    self.goalsLabel.text=[NSString stringWithFormat:@"%@/%@",model.goals_pro,model.goals_against];
    self.scoreLabel.text=model.points;
}

@end
