//
//  DQHotNewsModel.h
//  MyFootball
//
//  Created by jinx huang on 17/5/1.
//  Copyright © 2017年 huangjinyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DQHotNewsModel : NSObject
@property(nonatomic,strong)NSString* hotwords;

@property (nonatomic, assign) NSInteger min;

@property (nonatomic, assign) NSInteger hotNewsListId;

@property(nonatomic,strong)NSArray* recommend;

@property(nonatomic,strong)NSString* next;

@property(nonatomic,strong)NSArray* ad;

@property(nonatomic,strong)NSString* label;

@property (nonatomic, assign) NSInteger max;

@property (nonatomic, assign) NSInteger page;

@property(nonatomic,strong)NSArray* articles;

@property(nonatomic,strong)NSString* prev;

@property(nonatomic, strong) NSString *hotNewsKey; //数据库主键

@end


@interface DQHotNewsSingleItem : NSObject

@property(nonatomic,strong)NSString* scheme;

@property(nonatomic,strong)NSString* title;

@property(nonatomic,strong)NSString* url;

@property (nonatomic, assign) NSInteger sort_timestamp;

@property (nonatomic, assign) BOOL top;

@property(nonatomic,strong)NSString* published_at;

@property(nonatomic,strong)NSString* share;

@property(nonatomic,strong)NSString* channel;

@property(nonatomic,strong)NSString* top_color;

@property(nonatomic,strong)NSString* url1;

@property (nonatomic, assign) BOOL is_video;

@property (nonatomic, assign) NSInteger articleId;

@property(nonatomic,strong)NSString* add_to_tab;

@property (nonatomic, assign) BOOL show_comments;

@property (nonatomic, assign) BOOL is_ad;

@property (nonatomic, assign) NSInteger position;

@property(nonatomic,strong)NSString* ad_id;

@property(nonatomic,strong)NSString* share_title;

@property(nonatomic,strong)NSString* thumb;

@property(nonatomic,strong)NSString* label;

@property(nonatomic,strong)NSString* label_color;

@property (nonatomic, assign) NSInteger comments_total;

@property(nonatomic,strong)NSString* itemDescription;
@end

