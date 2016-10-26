//
//  DQArticleDetail.m
//  MyFootball
//
//  Created by huangjinyang on 16/10/26.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQArticleDetail.h"

@implementation DQArticleDetail

+(NSDictionary* )mj_replacedKeyFromPropertyName{
    return @{
             @"articleId":@"id",
             @"articleDescription":@"description"
             };
}

@end
