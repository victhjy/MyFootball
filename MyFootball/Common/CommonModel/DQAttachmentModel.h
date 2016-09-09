//
//  DQAttachmentModel.h
//  MyFootball
//
//  Created by huangjinyang on 16/9/9.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DQAttachmentModel : NSObject

@property(nonatomic,strong)NSString* url;

@property(nonatomic,strong)NSString* thumb;

@property(nonatomic,strong)NSString* mime;

@property(nonatomic,assign)NSInteger width;

@property(nonatomic,assign)NSInteger height;

@property(nonatomic,assign)NSInteger size;

@end
