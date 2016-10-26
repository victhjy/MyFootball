//
//  DQArticleDetail.h
//  MyFootball
//
//  Created by huangjinyang on 16/10/26.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DQArticleDetail : NSObject
@property(nonatomic,strong)NSString* articleId;

@property(nonatomic,strong)NSString* title;

@property(nonatomic,strong)NSString* share;

@property(nonatomic,strong)NSString* thumb;

@property(nonatomic,strong)NSString* articleDescription;

@property (nonatomic, assign) BOOL collected;

@property (nonatomic, assign) NSInteger comments_total;

@property(nonatomic,strong)NSString* url;
@end
