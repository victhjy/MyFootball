//
//  DQCommunityModel.m
//  MyFootball
//
//  Created by huangjinyang on 16/10/11.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQCommunityModel.h"

@implementation DQCommunityModel
+(NSDictionary* )mj_replacedKeyFromPropertyName{
    return @{
             @"communityId":@"id"
             };
}
MJExtensionCodingImplementation
@end


@implementation DQCommunitySingleModel
+(NSDictionary* )mj_replacedKeyFromPropertyName{
    return @{
             @"singleCommunityId":@"id"
             };
}
MJExtensionCodingImplementation
@end