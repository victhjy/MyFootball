//
//  DQNavigationBar.m
//  MyFootball
//
//  Created by posun on 2017/7/18.
//  Copyright © 2017年 huangjinyang. All rights reserved.
//

#import "DQNavigationBar.h"

@implementation DQNavigationBar


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
    }
    return self;
}

- (void)customInit {
    self.backgroundColor=ThemeColor;
    UIButton* backButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:IMAGENAME(@"newGood") forState:UIControlStateNormal];
    backButton.frame=CGRectMake(12, 12, 25, 25);
    [self addSubview:backButton];
    WeakSelf
    [backButton addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        if (weakSelf.block) {
            weakSelf.block(nil);
        }
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
