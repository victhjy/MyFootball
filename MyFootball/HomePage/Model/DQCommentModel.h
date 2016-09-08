//
//  DQCommentModel.h
//  MyFootball
//
//  Created by huangjinyang on 16/9/8.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <Foundation/Foundation.h>

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

@interface DQSingleComment : NSObject

@end
