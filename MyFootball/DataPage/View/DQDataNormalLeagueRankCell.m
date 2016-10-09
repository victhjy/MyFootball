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
        self.contentView.backgroundColor=DATACELLBGCOLOR;
        self.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void)createUI{
//    self.contentView.backgroundColor=[MyTools colorWithHexString:@"0x4b4b4b"];
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
        make.left.equalTo(self.contentView).offset(padding);
        make.centerY.equalTo(self.contentView);
    }];
    [self.teamImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.rankLabel);
        make.left.equalTo(self.self.contentView.mas_left).offset(padding*3);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [self.teamNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.rankLabel);
        make.left.equalTo(self.teamImage.mas_right).offset(5);
        make.right.equalTo(self.contentView.mas_centerX).offset(-5);
    }];
    [self.gamesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.rankLabel);
         make.centerX.equalTo(self.contentView).offset(-5);
    }];
    
    [self.winLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.gamesLabel.mas_right).offset(UIScreenWidth/24);
        make.centerX.equalTo(self.gamesLabel.mas_centerX).offset(UIScreenWidth/12);
        make.centerY.equalTo(self.rankLabel);
    }];
    
    [self.drawLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.rankLabel);
//        make.left.equalTo(self.winLabel.mas_right).offset(UIScreenWidth/24);
        make.centerX.equalTo(self.winLabel.mas_centerX).offset(UIScreenWidth/12);
    }];
    
    [self.defeatLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.rankLabel);
//        make.left.equalTo(self.drawLabel.mas_right).offset(UIScreenWidth/24);
         make.centerX.equalTo(self.drawLabel.mas_centerX).offset(UIScreenWidth/12);
    }];
    
    [self.goalsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.rankLabel);
        make.centerX.equalTo(self.defeatLabel.mas_centerX).offset(UIScreenWidth/9);
    }];
    
    [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.rankLabel);
        make.right.equalTo(self.contentView).offset(-padding);
    }];

    UILabel* line=[UILabel new];
    line.backgroundColor=[MyTools colorWithHexString:@"0x454545"];
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
    }];
}

-(void)configWithModel:(DQDataSingleTeamModel* )model{
    
    if (self.colorTop) {
        self.contentView.backgroundColor=ThemeColor;
    }
     else if (self.colorBottom) {
        self.contentView.backgroundColor=[UIColor grayColor];
    }
     else{
         self.contentView.backgroundColor=[MyTools colorWithHexString:@"0x4b4b4b"];
     }

    
    self.rankLabel.text=model.rank;
    [self.teamImage sd_setImageWithURL:[NSURL URLWithString:TEAMIMAGE(model.team_id)] placeholderImage:IMAGENAME(@"2016")];
    self.teamNameLabel.text=model.club_name;
    self.gamesLabel.text=model.matches_total;
    self.winLabel.text=model.matches_won;
    self.drawLabel.text=model.matches_draw;
    self.defeatLabel.text=model.matches_lost;
    self.goalsLabel.text=[NSString stringWithFormat:@"%@/%@",model.goals_pro,model.goals_against];
    self.scoreLabel.text=model.points;
}
-(void)prepareForReuse{
    self.colorTop=nil;
    self.colorBottom=nil;
}
@end
