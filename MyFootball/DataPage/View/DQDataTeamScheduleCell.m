//
//  DQDataTeamScheduleCell.m
//  MyFootball
//
//  Created by huangjinyang on 16/10/8.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQDataTeamScheduleCell.h"

@implementation DQDataTeamScheduleCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
        self.contentView.backgroundColor=DATACELLBGCOLOR;
    }
    return self;
}

-(void)createUI{
    self.timeLabel=[UILabel new];
    self.teamAImage=[UIImageView new];
    self.teamBImage=[UIImageView new];
    self.teamLabelA=[UILabel new];
    self.teamLabelB=[UILabel new];
    self.VS=[UILabel new];
    
    self.timeLabel.textColor=[UIColor whiteColor];
    self.teamLabelB.textColor=self.timeLabel.textColor;
    self.teamLabelA.textColor=self.timeLabel.textColor;
    self.VS.textColor=self.timeLabel.textColor;
    self.VS.text=@"VS";
    
    self.teamLabelA.font=[UIFont systemFontOfSize:12];
    self.teamLabelB.font=self.teamLabelA.font;
    self.VS.font=self.teamLabelA.font;
    self.timeLabel.font=self.teamLabelA.font;
    
//    self.teamBImage.image=IMAGENAME(@"2016");
//    self.teamAImage.image=IMAGENAME(@"2016");
    self.teamLabelA.textAlignment=NSTextAlignmentRight;
    
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.teamLabelA];
    [self.contentView addSubview:self.teamAImage];
    [self.contentView addSubview:self.VS];
    [self.contentView addSubview:self.teamBImage];
    [self.contentView addSubview:self.teamLabelB];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(20);
    }];
    
    [self.VS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.timeLabel);
        make.centerX.equalTo(self.contentView).offset(UIScreenWidth/8);
    }];
    [self.teamAImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.centerY.equalTo(self.timeLabel);
        make.right.equalTo(self.VS.mas_left).offset(-10);
    }];
    [self.teamLabelA mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.teamAImage.mas_left).offset(-10);
        make.centerY.equalTo(self.timeLabel);
    }];
    
    [self.teamBImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.centerY.equalTo(self.timeLabel);
        make.left.equalTo(self.VS.mas_right).offset(10);
    }];
    [self.teamLabelB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.teamBImage.mas_right).offset(10);
        make.centerY.equalTo(self.timeLabel);
    }];
    
    UILabel* line=[UILabel new];
    line.backgroundColor=[MyTools colorWithHexString:@"0x454545"];
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
    }];
}

-(void)configWithModel:(DQDataScheduleModel* )model{
    self.teamLabelA.text=model.team_A_name;
    self.teamLabelB.text=model.team_B_name;
    NSDate *gameTime=[MyTools getNowDateFromatAnDate:[MyTools getDateFromDataString:model.start_play]];
    self.timeLabel.text=[MyTools dateStringFromNSDate:gameTime];
    [self.teamAImage sd_setImageWithURL:[NSURL URLWithString:TEAMIMAGE(model.team_A_id)] placeholderImage:IMAGENAME(@"2016")];
    [self.teamBImage sd_setImageWithURL:[NSURL URLWithString:TEAMIMAGE(model.team_B_id)] placeholderImage:IMAGENAME(@"2016")];
}
@end
