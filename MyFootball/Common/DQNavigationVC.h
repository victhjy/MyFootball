//
//  DQNavigationVC.h
//  MyFootball
//
//  Created by posun on 2017/7/18.
//  Copyright © 2017年 huangjinyang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DQNavigationBar;
@interface DQNavigationVC : UINavigationController

@property(nonatomic, assign) BOOL DQNavigationBarHidden;

@property(nonatomic, strong) DQNavigationBar *DQnavigationBar;

@end
