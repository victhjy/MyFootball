//
//  DQDataTeamsRankModel.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/12.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQDataTeamsRankModel.h"

@implementation DQDataTeamsRankModel

@end

@implementation DQDataSingleTeamModel

+(NSDictionary* )mj_replacedKeyFromPropertyName{
    return @{
        @"clubId":@"id"
        };
}

@end