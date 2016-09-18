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

//球员进球、助攻排名
@interface DQDataPlayerRankModel : NSObject

@property(nonatomic,strong)NSString* person_id;
@property(nonatomic,strong)NSString* name;
@property(nonatomic,strong)NSString* team_id;
@property(nonatomic,strong)NSString* team_name;
@property(nonatomic,strong)NSString* count;

@property(nonatomic,strong)NSString* rank;

@end

//联赛赛程Model
@interface DQDataLeagueScheduleModel : NSObject

@property(nonatomic,strong)NSString* endnum;
@property(nonatomic,strong)NSString* nownum;
@property(nonatomic,strong)NSArray* matches;

@end


//球队赛程model
@interface DQDataScheduleModel : NSObject

@property(nonatomic,strong)NSString* round_id;

@property(nonatomic,strong)NSString* time_utc;

@property(nonatomic,strong)NSString* gameweek;

@property(nonatomic,strong)NSString* group_id;

@property(nonatomic,strong)NSString* status;

@property(nonatomic,strong)NSString* fs_B;

@property(nonatomic,strong)NSString* date_utc;

@property(nonatomic,strong)NSString* suretime;

@property(nonatomic,strong)NSString* team_A_id;

@property(nonatomic,strong)NSString* as_A;

@property(nonatomic,strong)NSString* relate_type;

@property(nonatomic,strong)NSString* match_id;

@property(nonatomic,strong)NSString* ets_B;

@property(nonatomic,strong)NSString* playing_time;

@property (nonatomic, assign) NSInteger relate_id;

@property(nonatomic,strong)NSString* ps_A;

@property(nonatomic,strong)NSString* ets_A;

@property(nonatomic,strong)NSString* team_B_name;

@property(nonatomic,strong)NSString* fs_A;

@property(nonatomic,strong)NSString* as_B;

@property(nonatomic,strong)NSString* team_A_name;

@property(nonatomic,strong)NSString* start_play;

@property(nonatomic,strong)NSString* ps_B;

@property(nonatomic,strong)NSString* team_B_id;

@end

