//
//  MyTools.h
//  MyFootball
//
//  Created by huangjinyang on 16/9/2.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyTools : NSObject
/**
 *  16进制颜色
 *
 *  @param hexColorString 16进制值
 *
 *  @return 16进制对应颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)hexColorString;

/**
 *  根据字典生成属性
 *
 *  @param dic 输入的字典
 */
+(void)importADic:(NSDictionary*)dic;
@end
