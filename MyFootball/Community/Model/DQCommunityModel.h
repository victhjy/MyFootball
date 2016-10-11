//
//  DQCommunityModel.h
//  MyFootball
//
//  Created by huangjinyang on 16/10/11.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DQCommunitySingleModel;
@interface DQCommunityModel : NSObject
@property (nonatomic, assign) BOOL open;

@property (nonatomic, assign) NSInteger communityId;

@property(nonatomic,strong)NSString* name;

@property(nonatomic,strong)NSArray * groups;

@property (nonatomic, assign) NSInteger groups_total;
@end

@interface DQCommunitySingleModel : NSObject
@property (nonatomic, assign) NSInteger singleCommunityId;

@property(nonatomic,strong)NSString* thumb;

@property(nonatomic,strong)NSString* jump_url;

@property (nonatomic, assign) NSInteger ads_id;

@property(nonatomic,strong)NSString* article_thumb;

@property(nonatomic,strong)NSString* created_at;

@property (nonatomic, assign) NSInteger visits;

@property (nonatomic, assign) NSInteger star;

@property(nonatomic,strong)NSString* type;

@property(nonatomic,strong)NSString* title;

@property (nonatomic, assign) NSInteger is_ads;

@property (nonatomic, assign) NSInteger is_feedback;

@property(nonatomic,strong)NSString* banner;

@property (nonatomic, assign) NSInteger is_black_room;

@property (nonatomic, assign) NSInteger topic_total;

@property (nonatomic, assign) NSInteger league_id;

@property(nonatomic,strong)NSString* status;

@property (nonatomic, assign) NSInteger join_user_total;

@end