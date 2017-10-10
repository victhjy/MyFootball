//
//  DQAppManager.h
//  MyFootball
//
//  Created by huangjinyang on 17/9/6.
//  Copyright © 2017年 huangjinyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DQAppManager : NSObject

@property(nonatomic, copy) NSString *appName;
@property(nonatomic, assign) BOOL simulator;


+(instancetype)share;

- (void)recordHttpRequestLog:(NSString *)str;
@end
