//
//  MyTools.h
//  MyFootball
//
//  Created by huangjinyang on 16/9/2.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^EventBlock)(id info);

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

/**
 *  缓存数据
 *
 *  @param object 需要缓存的数据
 *  @param key    key
 */
+(void)cacheData:(NSObject* )object withKey:(NSString* )key;

/**
 *  获取缓存
 *
 *  @param key key
 *
 *  @return 取出的缓存
 */
+(NSObject* )getCacheDataForKey:(NSString* )key;

/**
 *  utc时间转换成本地时间
 *
 *  @param anyDate utc时间
 *
 *  @return 本地时间
 */
+ (NSDate *)getNowDateFromatAnDate:(NSDate *)anyDate;

/**
 *  讲字符串转换成nsdate
 *
 *  @param dateString 时间型字符串
 *
 *  @return NSDate型时间
 */
+(NSDate* )getDateFromDataString:(NSString* )dateString;


/**
 *  nsdate转字符串
 *
 *  @param date 输入NSDate
 *
 *  @return 输出字符串型的时间 10-12 12：00
 */
+(NSString* )dateStringFromNSDate:(NSDate* )date;


+(void)showText:(NSString* )text inView:(UIView* )view;
+(void)showLoadingInView:(UIView* )view;
+(void)hideLoadingViewInView:(UIView* )view;

/**
 *  生成二维码图片
 *
 *  @param dataString 数据字符串
 *
 *  @return 二维码图片
 */
+(UIImage* )generateQRCode:(NSString* )dataString;

/**
 *          获取当前控制器
 */
+(UIViewController *)currentViewController;

//字典、数组转json
+(NSString *)convertToJsonData:(id )dict;


//保存图片
+(void)saveImageDocuments:(UIImage *)image andName:(NSString *) imageName;

//获取图片
+(UIImage *)getDocumentImageFromName:(NSString *)imageName;

+(NSString *)getDeviceIdentifier;
@end
