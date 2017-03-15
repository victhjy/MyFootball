//
//  DQDrawTool.h
//  MyFootball
//
//  Created by huangjinyang on 17/3/10.
//  Copyright © 2017年 huangjinyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DQDrawTool : NSObject
@property(nonatomic,strong)UIColor* pathColor;
@property(nonatomic,assign)CGFloat pathWith;
@property(nonatomic,strong)NSMutableArray* path;
@end
