//
//  DQGifCellItem.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/26.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQGifCellItemView.h"

@implementation DQGifCellItemView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)configWithItemModel:(DQChineseTeamSubItemModel* )itemModel{
    self.backgroundColor=[UIColor whiteColor];
    [self addSubview:self.imageView];
    [self addSubview:self.itemTitle];
    [self addSubview:self.timeLabel];
    [self addSubview:self.commentCount];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.mas_equalTo(100);
        make.top.equalTo(self);
    }];
    [self.itemTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).offset(10);
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.bottom.equalTo(self).offset(-5);
    }];
    
    [self.commentCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.bottom.equalTo(self).offset(-5);
    }];

    
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:itemModel.thumb] placeholderImage:IMAGENAME(@"default_image")];
    self.timeLabel.text=[NSString stringWithFormat:@"%@'",itemModel.time];
    self.commentCount.text=[NSString stringWithFormat:@"%zd评论",itemModel.comments_total];
    self.itemTitle.text=itemModel.title;
    
    [self layoutSubviews];
}

-(UILabel*)itemTitle
{
    if(!_itemTitle)
    {
        _itemTitle=[UILabel new];
        _itemTitle.numberOfLines=2;
        _itemTitle.font=[UIFont systemFontOfSize:12];
    }
    return _itemTitle;
}

-(UIImageView*)imageView
{
    if(!_imageView)
    {
        _imageView=[UIImageView new];
    }
    return _imageView;
}

-(UILabel*)timeLabel
{
    if(!_timeLabel)
    {
        _timeLabel=[UILabel new];
        _timeLabel.textColor=ThemeColor;
        _timeLabel.font=[UIFont systemFontOfSize:12];
    }
    return _timeLabel;
}

-(UILabel*)commentCount
{
    if(!_commentCount)
    {
        _commentCount=[UILabel new];
        _commentCount.textColor=[UIColor grayColor];
        _commentCount.font=[UIFont systemFontOfSize:12];
    }
    return _commentCount;
}

@end
