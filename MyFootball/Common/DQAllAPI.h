//
//  DQAllAPI.h
//  MyFootball
//
//  Created by huangjinyang on 16/9/8.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const APIChinsesTeamList; //获取国足的列表

extern NSString* const APIGetComments; //获取评论

extern NSString* const APIGetDataTeamRanking; //球队积分排行

extern NSString* const APIGetDataGoalRanking; //球员进球排行

extern NSString* const APIGetDataAssistRanking; //球员助攻排行

extern NSString* const APIGetDataGameSchedule; //球队赛程排行

extern NSString* const APIGetDataTeamRounding; //联赛当前轮数

@interface DQAllAPI : NSObject
@end
