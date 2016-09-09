//
//  DQCommentModel.h
//  MyFootball
//
//  Created by huangjinyang on 16/9/8.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DQUserModel.h"
#import "DQAttachmentModel.h"
@interface DQCommentModel : NSObject

@property(nonatomic,strong)NSArray* comments;

@property(nonatomic,strong)NSDictionary* article;

@property (nonatomic, assign) NSInteger commentModelId;

@property(nonatomic,strong)NSString* title;

@property(nonatomic,strong)NSString* next;

@property (nonatomic, assign) NSInteger total;

@property(nonatomic,strong)NSDictionary* pendant;

@property(nonatomic,strong)NSArray* recommends;

@end


@interface DQSingleCommentModel : NSObject

@property(nonatomic,strong)NSString* singleCommentId;

@property(nonatomic,strong)NSString* content;

@property(nonatomic,assign)NSInteger up;

@property(nonatomic,strong)NSString* created_at;

@property(nonatomic,assign)BOOL recommend;

@property(nonatomic,strong)DQUserModel* user;

@property(nonatomic,strong)DQSingleCommentModel* quote;

@property(nonatomic,assign)NSInteger attachments_total;

@property(nonatomic,strong)NSArray* attachments;

@end

