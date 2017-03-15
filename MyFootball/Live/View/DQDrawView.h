//
//  DQDrawView.h
//  MyFootball
//
//  Created by huangjinyang on 17/3/14.
//  Copyright © 2017年 huangjinyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DQDrawView : UIView
@property(nonatomic,strong)UIColor* pathColor;
@property(nonatomic,assign)CGFloat pathWith;
@property(nonatomic,strong)NSMutableArray* path;
@end
