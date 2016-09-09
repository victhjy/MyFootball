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

/**
 *  根据字符串字体获取字符串大小
 *
 *  @param text 字符串
 *  @param size **
 *  @param font 字体
 *
 *  @return 所占位置
 */
+(CGSize)string:(NSString* )text boundingRectWithSize:(CGSize)size font:(UIFont* )font;

/**
 *  字符串转字符串时间
 *
 *  @param string 时间格式的字符串
 *
 *  @return 时间字符串，月月-日日 时时：分分
 */
+(NSString* )stringDateFromString:(NSString* )string;
@end
