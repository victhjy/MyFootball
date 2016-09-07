//
//  DQChineseTeamCell.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/7.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//
#define imageW ([UIScreen mainScreen].bounds.size.width-40)/3
#import "DQChineseTeamCell.h"

@implementation DQChineseTeamCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createView];
        [self configViews];
        self.contentView.backgroundColor=[MyTools colorWithHexString:@"0xf4f3f4"];
    }
    return self;
}

-(void)createView{
    
    self.title=[UILabel new];
    self.title.font=[UIFont systemFontOfSize:14];
    self.title.textColor=[UIColor blackColor];
    self.title.numberOfLines=0;
    [self.contentView addSubview:self.title];
    
    self.detail=[UILabel new];
    self.detail.font=[UIFont systemFontOfSize:12];
    self.detail.textColor=[UIColor grayColor];
    self.detail.numberOfLines=0;
    [self.contentView addSubview:self.detail];
    
    self.imageViewLeft=[UIImageView new];
    self.imageViewLeft.layer.masksToBounds=YES;
    self.imageViewLeft.layer.cornerRadius=2;
    [self.contentView addSubview:self.imageViewLeft];
    
    self.commentLabel=[UILabel new];
    self.commentLabel.font=self.detail.font;
    self.commentLabel.textColor=self.detail.textColor;
    [self.contentView addSubview:self.commentLabel];
    
    
}

-(void)configViews{
    
    CGFloat padding=10;
    
    [self.imageViewLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.contentView).offset(padding);
        make.bottom.mas_equalTo(self.contentView).offset(-padding);
        make.width.mas_equalTo(imageW);
    }];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imageViewLeft.mas_right).offset(padding);
        make.top.equalTo(self.contentView).offset(padding);
        make.right.mas_equalTo(self.contentView).offset(-padding);
    }];
    
    [self.detail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.title.mas_bottom);
        make.left.right.mas_equalTo(self.title);
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

-(void)configWithModel:(DQChineseTeamListModel *)model{
     CGFloat padding=10;
    [self.imageViewLeft sd_setImageWithURL:[NSURL URLWithString:model.thumb] placeholderImage:IMAGENAME(@"default_image")];
    self.title.text=model.title;
    self.detail.text=model.detail;
    self.commentLabel.text=[NSString stringWithFormat:@"%ld",(long)model.comments_total];
    
    //“推荐  深度” 无图集
    if (model.label&&model.label.length>0&&!model.album) {
        self.label=[UILabel new];
        self.label.textColor=[UIColor whiteColor];
        self.label.backgroundColor=[MyTools colorWithHexString:model.label_color];
        self.label.font=self.detail.font;
        self.label.text=model.label;
        self.label.layer.masksToBounds=YES;
        self.label.layer.cornerRadius=2;
        [self.contentView addSubview:self.label];
        
        [self.label mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView).offset(-padding);
            make.centerY.mas_equalTo(self.commentLabel.mas_centerY);
        }];
        [self.commentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.label.mas_left).offset(-5);
            make.baseline.mas_equalTo(self.contentView).offset(-padding);
        }];
    }
//    else{
//        [self.commentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(self.contentView).offset(-padding);
//            make.baseline.mas_equalTo(self.contentView).offset(-padding);
//        }];
//    }
    
    //图集 无推荐
    if (model.album&&!model.label) {
        self.imageViewLeft.hidden=YES;
        self.title.preferredMaxLayoutWidth=UIScreenWidth-padding*2;
        [self.title mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView).offset(padding);
            make.right.mas_equalTo(self.contentView).offset(-10);
        }];
        NSMutableArray* imagesArr=[NSMutableArray new];
        int count=model.album.total<3?:3;
         for (int i=0; i<count; i++) {
             UIImageView* imageView=[UIImageView new];
             [self.contentView addSubview:imageView];
             [imageView sd_setImageWithURL:[NSURL URLWithString:model.album.pics[i]] placeholderImage:IMAGENAME(@"default_image")];
             [imagesArr addObject:imageView];
         }
         for (int i=0; i<count; i++) {
             UIImageView* imageView=imagesArr[i];
             [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                 make.size.mas_equalTo(CGSizeMake(imageW, imageW*2/3));
                 make.centerX.equalTo(self.contentView.mas_centerX).offset((i-1)*(imageW+padding));
                 make.top.mas_equalTo(self.title.mas_bottom).offset(padding);
             }];
         }
        UIImageView* imageView=[imagesArr firstObject];
        [self.commentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(imageView.mas_bottom).offset(padding);
            make.right.equalTo(self.contentView).offset(-padding);
        }];

    }
    //图集  推荐
    if (model.album&&model.label) {
        self.imageViewLeft.hidden=YES;
        self.title.preferredMaxLayoutWidth=UIScreenWidth-padding*2;
        [self.title mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView).offset(padding);
            make.right.mas_equalTo(self.contentView).offset(-10);
        }];
        NSMutableArray* imagesArr=[NSMutableArray new];
        int count=model.album.total<3?:3;
        for (int i=0; i<count; i++) {
            UIImageView* imageView=[UIImageView new];
            [self.contentView addSubview:imageView];
            [imageView sd_setImageWithURL:[NSURL URLWithString:model.album.pics[i]] placeholderImage:IMAGENAME(@"default_image")];
            [imagesArr addObject:imageView];
        }
        for (int i=0; i<count; i++) {
            UIImageView* imageView=imagesArr[i];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(imageW, imageW*2/3));
                make.centerX.equalTo(self.contentView.mas_centerX).offset((i-1)*(imageW+padding));
                make.top.mas_equalTo(self.title.mas_bottom).offset(padding);
            }];
        }
        
        UIImageView* imageView=[imagesArr firstObject];
        self.label=[UILabel new];
        self.label.textColor=[UIColor whiteColor];
        self.label.backgroundColor=[MyTools colorWithHexString:model.label_color];
        self.label.font=self.detail.font;
        self.label.text=model.label;
        self.label.layer.masksToBounds=YES;
        self.label.layer.cornerRadius=2;
        [self.contentView addSubview:self.label];
        
        [self.label mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView).offset(-padding);
            make.centerY.mas_equalTo(self.commentLabel.mas_centerY);
        }];
        [self.commentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(imageView.mas_bottom).offset(padding);
            make.right.equalTo(self.label.mas_left).offset(-5);
        }];
    }
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self updateConstraints];
    [self layoutIfNeeded];
}

-(CGFloat)heightForCell{
    return self.commentLabel.frame.origin.y+self.commentLabel.frame.size.height+10;
}

-(void)prepareForReuse{
    [super prepareForReuse];
    self.label.text=nil;
}

@end
