//
//  DQChineseTeamModel.h
//  MyFootball
//
//  Created by huangjinyang on 16/9/7.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DQAlbum.h"

@interface DQChineseTeamModel : NSObject

@property (nonatomic, assign) NSInteger min;

@property (nonatomic, assign) NSInteger dicId;

@property(nonatomic,strong)NSString* next;

@property(nonatomic,strong)NSArray* ad;

@property(nonatomic,strong)NSString* label;

@property (nonatomic, assign) NSInteger max;

@property (nonatomic, assign) NSInteger page;

@property(nonatomic,strong)NSArray* articles;

@property(nonatomic,strong)NSString* prev;
@end

@interface DQChineseTeamListModel : NSObject

@property (nonatomic, assign) NSInteger articleId;

@property (nonatomic,strong)NSString* detail;

@property (nonatomic, assign) NSInteger comments_total;

@property(nonatomic,strong)NSString* thumb;

@property (nonatomic, assign) BOOL is_video;

@property(nonatomic,strong)NSString* collection_type;

@property(nonatomic,strong)NSString* published_at;

@property(nonatomic,strong)NSString* channel;

@property(nonatomic,strong)NSString* label;

@property(nonatomic,strong)NSString* url;

@property(nonatomic,strong)NSString* label_color;

@property(nonatomic,strong)NSString* title;

@property(nonatomic,strong)NSString* share_title;

@property(nonatomic,strong)NSString* share;

@property(nonatomic,strong)NSString* scheme;

@property(nonatomic,strong)NSString* url1;

@property (nonatomic, assign) BOOL top;

@property (nonatomic, strong)DQAlbum* album;

@property (nonatomic,strong)NSDictionary* sub_items;  //滚动视图

@end

@interface DQChineseTeamSubItemModel : NSObject


@property(nonatomic,strong)NSString* time;

@property(nonatomic,strong)NSString* itemId;

@property(nonatomic,strong)NSString* title;

@property(nonatomic,strong)NSString* match_id;

@property(nonatomic,strong)NSString* thumb;

@property (nonatomic, assign) NSInteger comments_total;

@property(nonatomic,strong)NSString* url;

@end