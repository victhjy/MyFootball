//
//  DQAFNetManager.h
//  MyFootball
//
//  Created by huangjinyang on 16/9/7.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface DQAFNetManager : AFHTTPSessionManager
//请求成功回调block
typedef void (^requestSuccessBlock)(NSDictionary *dic);

//请求失败回调block
typedef void (^requestFailureBlock)(NSError *error);

//请求方法define
typedef enum {
    GET,
    POST,
    PUT,
    DELETE,
    HEAD
} HTTPMethod;


+ (instancetype)sharedManager;

- (void)requestWithMethod:(HTTPMethod)method
                 WithPath:(NSString *)path
               WithParams:(NSDictionary*)params
         WithSuccessBlock:(requestSuccessBlock)success
          WithFailurBlock:(requestFailureBlock)failure;
@end
