//
//  DQCommentCell.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/8.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQCommentCell.h"

@implementation DQCommentCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    self.userPic=[UIImageView new];
    self.userName=[UILabel new];
    self.likedTeamPic=[UIImageView new];
    self.time=[UILabel new];
    self.likedCount=[UILabel new];
    self.like=[UIImageView new];
    self.commentDetail=[UILabel new];
    
    self.userName.textColor=ThemeColor;
    self.userName.font=[UIFont systemFontOfSize:12];
    
    self.time.textColor=[UIColor grayColor];
    self.time.font=self.userName.font;
    
    self.likedCount.textColor=self.userName.textColor;
    self.likedCount.font=self.userName.font;
    
    self.commentDetail.textColor=[UIColor blackColor];
    self.commentDetail.font=[UIFont systemFontOfSize:14];
    self.commentDetail.numberOfLines=0;
    self.commentDetail.preferredMaxLayoutWidth=UIScreenWidth-30;
    
    [self.contentView addSubview:self.userPic];
    [self.contentView addSubview:self.userName];
    [self.contentView addSubview:self.likedTeamPic];
    [self.contentView addSubview:self.time];
    [self.contentView addSubview:self.likedCount];
    [self.contentView addSubview:self.like];
    [self.contentView addSubview:self.commentDetail];
    
    [self.userPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(10);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userPic.mas_right).offset(5);
        make.top.equalTo(self.userPic);
    }];
    [self.likedTeamPic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(15, 15));
        make.top.equalTo(self.userPic);
        make.left.equalTo(self.userName.mas_right);
    }];
    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userName);
        make.bottom.equalTo(self.userPic);
    }];
    
    
    [self.likedCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.userPic);
        make.right.equalTo(self.like.mas_left).offset(-5);
    }];
    [self.like mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.likedCount.mas_baseline);
//        make.centerY.equalTo(self.likedCount);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
    [self.commentDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userPic.mas_bottom).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-20);
    }];
    
    
}

-(void)configWithModel:(DQSingleCommentModel* )model{
//    //是回复的评论
//    if (model.quote) {
//        
//    }
//    //普通评论
//    else{
        [self.userPic sd_setImageWithURL:[NSURL URLWithString:model.user.avatar] placeholderImage:[UIImage imageNamed:@"Defaultuser"]];
        self.userName.text=model.user.username;
        self.likedTeamPic.image=[UIImage imageNamed:@"2016"];
        
        self.time.text=[NSString stringWithFormat:@"%@",model.created_at];
        self.likedCount.text=[NSString stringWithFormat:@"%ld",(long)model.up];
        self.like.image=[UIImage imageNamed:@"good_yellow"];
        self.commentDetail.text=model.content;
//    }
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self updateConstraints];
    [self layoutIfNeeded];
}

-(CGFloat)heightForCell{
    NSLog(@"%f   %f",self.commentDetail.frame.origin.y,self.commentDetail.frame.size.height);
    return self.commentDetail.frame.origin.y+self.commentDetail.frame.size.height+10;
}

@end
