//
//  DQHotNewsModel.m
//  MyFootball
//
//  Created by jinx huang on 17/5/1.
//  Copyright © 2017年 huangjinyang. All rights reserved.
//

#import "DQHotNewsModel.h"

@implementation DQHotNewsModel

+(NSDictionary* )mj_replacedKeyFromPropertyName{
    return @{
             @"hotNewsListId":@"id"
             };
}
@end


@implementation DQHotNewsSingleItem

+(NSDictionary* )mj_replacedKeyFromPropertyName{
    return @{
             @"itemDescription":@"description",
             @"articleId":@"id"
             };
}

@end
