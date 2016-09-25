//
//  DQChineseTeamModel.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/7.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQChineseTeamModel.h"

@implementation DQChineseTeamModel
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"dicId" : @"id"
             };
}
@end


@implementation DQChineseTeamListModel

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"articleId" : @"id",
             @"detail"   : @"description"
             };
}
@end

@implementation DQChineseTeamSubItemModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"itemId":@"id",
             };
}

@end