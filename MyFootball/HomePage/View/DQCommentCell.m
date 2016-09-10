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
    
    self.recommentBG=[UIView new];
    self.recommentDetail=[UILabel new];
    self.recommentUserName=[UILabel new];
    
    self.userName.textColor=ThemeColor;
    self.userName.font=[UIFont systemFontOfSize:12];
    
    self.time.textColor=[UIColor grayColor];
    self.time.font=self.userName.font;
    
    self.likedCount.textColor=self.time.textColor;
    self.likedCount.font=self.userName.font;
    
    self.commentDetail.textColor=[UIColor blackColor];
    self.commentDetail.font=[UIFont systemFontOfSize:14];
    self.commentDetail.numberOfLines=0;
    self.commentDetail.preferredMaxLayoutWidth=UIScreenWidth-30;
    
    self.recommentBG.backgroundColor=[MyTools colorWithHexString:@"0xe8e8e8"];
    self.recommentDetail.textColor=[MyTools colorWithHexString:@"0x8e8e8e"];
    self.recommentUserName.textColor=[MyTools colorWithHexString:@"0x6c6c6c"];
    self.recommentUserName.font=[UIFont systemFontOfSize:12];
    self.recommentDetail.font=self.recommentUserName.font;
    self.recommentDetail.numberOfLines=0;
    self.recommentDetail.preferredMaxLayoutWidth=UIScreenWidth-60;
    
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
//        make.bottom.equalTo(self.likedCount.mas_baseline);
        make.centerY.equalTo(self.likedCount);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    
    [self.commentDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userPic.mas_bottom).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-20);
    }];
    
    
    //底部线条
    UILabel* line=[UILabel new];
    line.backgroundColor=[MyTools colorWithHexString:@"0xdcdcdc"];
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.height.mas_equalTo(0.5);
        make.left.right.equalTo(self.contentView);
    }];

    
}

-(void)configWithModel:(DQSingleCommentModel* )model{
    self.tempHeight=0;
    //是回复的评论
    if (model.quote) {
        [self.contentView addSubview:self.recommentBG];
        [self.recommentBG addSubview:self.recommentUserName];
        [self.recommentBG addSubview:self.recommentDetail];
        
        [self.recommentUserName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.recommentBG).offset(10);
        }];
        [self.recommentDetail mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.recommentUserName);
            make.right.bottom.equalTo(self.recommentBG).offset(-10);
            make.top.equalTo(self.recommentUserName.mas_baseline).offset(10);
        }];
        
        [self.recommentBG mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.userPic.mas_bottom).offset(10);
            make.left.equalTo(self.contentView).offset(20);
            make.right.mas_equalTo(self.contentView).offset(-20);
            make.bottom.equalTo(self.recommentDetail.mas_bottom).offset(10);
        }];
        [self.commentDetail mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.recommentBG.mas_bottom).offset(10);
            make.left.equalTo(self.contentView).offset(10);
            make.right.equalTo(self.contentView).offset(-20);
        }];
        self.recommentUserName.text=model.quote.user.username;
        self.recommentDetail.text=model.quote.content;
        
        //recomment无图
        if(!model.attachments_total){
            
        }
        //recomment有图
        else{
            NSMutableArray* imagesArr=[NSMutableArray new];
            NSArray* attArr=[DQAttachmentModel mj_objectArrayWithKeyValuesArray:model.attachments];
            CGFloat width=(UIScreenWidth-(model.attachments_total+1)*10)/model.attachments_total;
            for (int i=0; i<model.attachments_total; i++) {
                
                DQAttachmentModel* attModel=attArr[i];
                //                CGFloat height=width*attModel.height/attModel.width;
                //                self.tempHeight=self.tempHeight<height?height:self.tempHeight;
                self.tempHeight=width;
                UIImageView* imageView=[UIImageView new];
                imageView.contentMode=UIViewContentModeScaleToFill;
                [imageView sd_setImageWithURL:[NSURL URLWithString:attModel.url] placeholderImage:IMAGENAME(@"default_image")];
                
                [self.contentView addSubview:imageView];
                [imagesArr addObject:imageView];
            }
            for (int i=0; i<model.attachments_total; i++) {
                self.tempImageView=imagesArr[i];
                [self.tempImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(self.commentDetail.mas_bottom).offset(10);
                    make.left.mas_equalTo(self.contentView).offset((i-1)*width+10*i);
                    make.size.mas_equalTo(CGSizeMake(width, width));
                }];
            }
            
            
        }
        
    }
    //普通评论
    else{
        //normal无图
        if(!model.attachments_total){
            
        }
        //normal有图
        else{
            NSMutableArray* imagesArr=[NSMutableArray new];
            NSArray* attArr=[DQAttachmentModel mj_objectArrayWithKeyValuesArray:model.attachments];
            CGFloat width=(UIScreenWidth-(model.attachments_total+1)*10)/model.attachments_total;
            for (int i=0; i<model.attachments_total; i++) {
                
                DQAttachmentModel* attModel=attArr[i];
//                CGFloat height=width*attModel.height/attModel.width;
//                self.tempHeight=self.tempHeight<height?height:self.tempHeight;
                self.tempHeight=width+10;
                UIImageView* imageView=[UIImageView new];
                imageView.contentMode=UIViewContentModeScaleToFill;
                [imageView sd_setImageWithURL:[NSURL URLWithString:attModel.url] placeholderImage:IMAGENAME(@"default_image")];
                
                [self.contentView addSubview:imageView];
                [imagesArr addObject:imageView];
            }
            for (int i=0; i<model.attachments_total; i++) {
                self.tempImageView=imagesArr[i];
                [self.tempImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(self.commentDetail.mas_bottom).offset(10);
                    make.left.mas_equalTo(self.contentView).offset((i-1)*width+10*i);
                    make.size.mas_equalTo(CGSizeMake(width, width));
                }];
            }
            
            
        }

    }
    
    //评论者信息和时间
    self.commentDetail.text=model.content;
    [self.userPic sd_setImageWithURL:[NSURL URLWithString:model.user.avatar] placeholderImage:[UIImage imageNamed:@"Defaultuser"]];
    self.userName.text=model.user.username;
    self.likedTeamPic.image=[UIImage imageNamed:@"2016"];
    self.time.text=[NSString stringWithFormat:@"%@",[MyTools stringDateFromString:model.created_at]];
    self.likedCount.text=[NSString stringWithFormat:@"%ld",(long)model.up];
    
    if (model.recommend) {
        self.like.image=[UIImage imageNamed:@"good_yellow"];
    }
    else
    {
        self.like.image=[UIImage imageNamed:@"NewGrayUp"];
    }
    

    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self updateConstraints];
    [self layoutIfNeeded];
}

//-(void)prepareForReuse{
//    self.tempHeight=0;
//}

-(CGFloat)heightForCell{
//    NSLog(@"%f   %f",self.commentDetail.frame.origin.y,self.commentDetail.frame.size.height);
    return self.commentDetail.frame.origin.y+self.commentDetail.frame.size.height+10+self.tempHeight;
}

@end
