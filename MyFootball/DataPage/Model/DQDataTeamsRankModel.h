//
//  DQDataTeamsRankModel.h
//  MyFootball
//
//  Created by huangjinyang on 16/9/12.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DQDataTeamsRankModel : NSObject
@property(nonatomic,strong)NSString* groups;

@property(nonatomic,strong)NSString* aggrCount;

@property(nonatomic,strong)NSString* round_id;

@property(nonatomic,strong)NSString* rankingsCount;

@property(nonatomic,strong)NSString* matchCount;

@property(nonatomic,strong)NSArray* rankings;

@property(nonatomic,strong)NSString* name;
@end

@interface DQDataSingleTeamModel : NSObject
@property(nonatomic,strong)NSString* clubId;

@property(nonatomic,strong)NSString* club_name;

@property(nonatomic,strong)NSString* adjust_rank;

@property(nonatomic,strong)NSString* points;

@property(nonatomic,strong)NSString* matches_total;

@property(nonatomic,strong)NSString* matches_draw;

@property(nonatomic,strong)NSString* matches_won;

@property(nonatomic,strong)NSString* rank;

@property(nonatomic,strong)NSString* goals_against;

@property(nonatomic,strong)NSString* last_rank;

@property(nonatomic,strong)NSString* team_id;

@property(nonatomic,strong)NSString* matches_lost;

@property(nonatomic,strong)NSString* goals_pro;

@end
