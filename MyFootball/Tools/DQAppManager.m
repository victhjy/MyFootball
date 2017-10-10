//
//  DQAppManager.m
//  MyFootball
//
//  Created by huangjinyang on 17/9/6.
//  Copyright © 2017年 huangjinyang. All rights reserved.
//

#import "DQAppManager.h"

@implementation DQAppManager

static DQAppManager *_app;

+(instancetype)share{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _app =[DQAppManager new];
    });
    return _app;
}

#pragma mark - appName

-(NSString *)appName{
    NSString *allName=[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    NSArray *arr=[allName componentsSeparatedByString:@"."];
    return [arr lastObject];
}

#pragma mark - simulator

-(BOOL)simulator{
#if TARGET_IPHONE_SIMULATOR
    return YES;
#else
    return NO;
#endif
}

#pragma mark - request log

- (void)recordHttpRequestLog:(NSString *)str {
    [self writeLog:str];
}

#pragma mark - private method

- (void)writeLog:(NSString *)logStr {
    NSMutableString *content=[logStr mutableCopy];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *today = [dateFormatter stringFromDate:[NSDate date]];
    NSString *filePathH = [NSString stringWithFormat:@"/Users/jinxhuang/Documents/AppLogs/%@Logs---%@.h",self.appName,today];
    if(![fileManager fileExistsAtPath:filePathH]){
        [fileManager createFileAtPath:filePathH contents:nil attributes:nil];
        [content appendString:@"\n"];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM-dd HH:mm:ss"];
        NSString *datestr = [dateFormatter stringFromDate:[NSDate date]];
        [content insertString:datestr atIndex:0];
        [content writeToFile:filePathH atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    else{
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:filePathH];
        
        [fileHandle seekToEndOfFile];  //将节点跳到文件的末尾
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM-dd HH:mm:ss"];
        NSString *datestr = [dateFormatter stringFromDate:[NSDate date]];
        
        NSString *line = @"\n--------------------------------------------------------------\n";
        content = [[NSString stringWithFormat:@"#pragma mark - %@\n%@     ;\n%@",datestr,content,line] mutableCopy];
        NSData* stringData  = [content dataUsingEncoding:NSUTF8StringEncoding];
        [fileHandle writeData:stringData]; //追加写入数据
        [fileHandle closeFile];
    }
}

@end
