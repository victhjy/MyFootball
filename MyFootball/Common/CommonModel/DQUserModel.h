//
//  DQUserModel.h
//  MyFootball
//
//  Created by huangjinyang on 16/9/8.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DQUserModel : NSObject

@property(nonatomic,strong)NSString* userId;

@property(nonatomic,strong)NSString* username;

@property(nonatomic,strong)NSString* avatar; //头像

@property(nonatomic,strong)NSString* medal_id;

@property(nonatomic,strong)NSString* medal_desc;

@property(nonatomic,strong)NSString* team_id;

@property(nonatomic,strong)NSString* team_icon;

@end
