//
//  DQCommunityCollectionHeaderView.m
//  MyFootball
//
//  Created by huangjinyang on 16/10/11.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQCommunityCollectionHeaderView.h"

@implementation DQCommunityCollectionHeaderView
-(void)prepareForReuse{
    [super prepareForReuse];
    self.textLabel.text=nil;
}
-(UILabel* )textLabel{
    if (!_textLabel) {
        _textLabel=[UILabel new];
        _textLabel.font=[UIFont systemFontOfSize:12];
        [self addSubview:_textLabel];
        [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self).offset(10);
        }];
        UILabel* line=[UILabel new];
        line.backgroundColor=[UIColor lightGrayColor];
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.height.mas_equalTo(0.5);
        }];
    }
    return _textLabel;
}
@end
