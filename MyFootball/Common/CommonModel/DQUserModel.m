//
//  DQUserModel.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/8.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQUserModel.h"

@implementation DQUserModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"userId" : @"id"
             };
}
@end
