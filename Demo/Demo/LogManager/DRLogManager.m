//
//  DRLogManager.m
//  Demo
//
//  Created by Damon on 2019/8/12.
//  Copyright © 2019年 DR. All rights reserved.
//

#import "DRLogManager.h"

@implementation DRLogManager

static DDFileLogger *debugFileLogger = nil;

+ (instancetype)defaultLogger
{
    static DRLogManager *defaultLogger = nil;
    static dispatch_once_t defaultPredicate;
    
    dispatch_once(&defaultPredicate, ^{
        if (nil == defaultLogger) {
            
            NSString *logPath=(NSString *)[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"Logs"];
            
            DDLogFileManagerDefault *fileManager=[[DDLogFileManagerDefault alloc] initWithLogsDirectory:logPath];
            [fileManager setMaximumNumberOfLogFiles:30];
            [fileManager setLogFilesDiskQuota:0ll];
            
            DDFileLogger *debugFileLogger = [[DDFileLogger alloc] initWithLogFileManager:fileManager];
            [debugFileLogger setMaximumFileSize:(1024 * 1024)];
            [debugFileLogger setRollingFrequency:(3600.0 * 24.0)];
            debugFileLogger=debugFileLogger;
            
            [DDLog addLogger:debugFileLogger];
            
            [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
            
            // DDTTYLogger，你的日志语句将被发送到Xcode控制台
            [DDLog addLogger:[DDTTYLogger sharedInstance]];
            // DDASLLogger，你的日志语句将被发送到苹果文件系统、你的日志状态会被发送到 Console.app
            [DDLog addLogger:[DDASLLogger sharedInstance]];
            
            defaultLogger = [[DRLogManager alloc] init];
            
        }
    });
    return defaultLogger;
}

/**
 *  记录日志，会保存到本地日志文件中并在控制台打印输出（Info）.
 */
- (void)logInfo:(NSString *)msg info:(NSString *)info
{

    DDLogInfo(@"[ICLogInfo] %@\n%@\n", info, msg);
}

/**
 *  记录日志，会保存到本地日志文件中并在控制台打印输出（Debug）.
 */
- (void)logDebug:(NSString *)msg info:(NSString *)info
{

    DDLogDebug(@"[ICLogDebug] %@\n%@\n",info,msg);
}

/**
 *  记录日志，会保存到本地日志文件中并在控制台打印输出（Error）.
 */
- (void)logError:(NSString *)msg info:(NSString *)info
{
    DDLogError(@"[ICLogError]%@\n%@\n", info, msg);
}

/**
 *  记录日志，会保存到本地日志文件中并在控制台打印输出（Warn）.
 */
- (void)logWarn:(NSString *)msg info:(NSString *)info
{
    
    DDLogWarn(@"[ICLogWarn] %@\n%@\n", info, msg);
}


@end
