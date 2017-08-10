//
//  DQNavigationVC.m
//  MyFootball
//
//  Created by posun on 2017/7/18.
//  Copyright © 2017年 huangjinyang. All rights reserved.
//

#import "DQNavigationVC.h"
#import "DQNavigationBar.h"
@implementation DQNavigationVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self customInit];
    }
    return self;
}

- (void)customInit {
    self.navigationBar.hidden=YES;
    self.DQnavigationBar=[[DQNavigationBar alloc]initWithFrame:CGRectMake(0, 20, UIScreenWidth, 44)];
    self.DQNavigationBarHidden=NO;
    self.DQnavigationBar.hidden=self.DQNavigationBarHidden;
    WeakSelf
    self.DQnavigationBar.block=^(id info){
        [weakSelf popViewControllerAnimated:YES];
    };
    [self.view addSubview:self.DQnavigationBar];
}

@end
