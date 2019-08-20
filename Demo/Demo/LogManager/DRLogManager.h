//
//  DRLogManager.h
//  Demo
//
//  Created by Damon on 2019/8/12.
//  Copyright © 2019年 DR. All rights reserved.
//

#import <Foundation/Foundation.h>

//  Info 日志
#ifndef DRLogInfo
#define DRLogInfo(s, ...)\
{\
[[DRLogManager defaultLogger] logInfo:[NSString stringWithFormat:(s), ##__VA_ARGS__] \
info:[NSString stringWithFormat:@"Function: %@", \
[NSString stringWithUTF8String:__PRETTY_FUNCTION__]]];\
}
#endif

//  Debug 日志
#ifndef DRLogDebug
#define DRLogDebug(s, ...)\
{\
[[DRLogManager defaultLogger] logDebug:[NSString stringWithFormat:(s), ##__VA_ARGS__] \
info:[NSString stringWithFormat:@"Function: %@", \
[NSString stringWithUTF8String:__PRETTY_FUNCTION__]]];\
}
#endif

//  Error 日志
#ifndef DRLogError
#define DRLogError(s, ...)\
{\
[[DRLogManager defaultLogger] logError:[NSString stringWithFormat:(s), ##__VA_ARGS__] \
info:[NSString stringWithFormat:@"Function: %@", \
[NSString stringWithUTF8String:__PRETTY_FUNCTION__]]];\
}
#endif

//  Warn 日志
#ifndef DRLogWarn
#define DRLogWarn(s, ...)\
{\
[[DRLogManager defaultLogger] logWarn:[NSString stringWithFormat:(s), ##__VA_ARGS__] \
info:[NSString stringWithFormat:@"Function: %@", \
[NSString stringWithUTF8String:__PRETTY_FUNCTION__]]];\
}

#endif

NS_ASSUME_NONNULL_BEGIN

@interface DRLogManager : NSObject

/**
 *  单例对象.
 */
+ (instancetype)defaultLogger;

/**
 *  记录日志，会保存到本地日志文件中并在控制台打印输出（Info）.
 */
- (void)logInfo:(NSString *)msg info:(NSString *)info;

/**
 *  记录日志，会保存到本地日志文件中并在控制台打印输出（Debug）.
 */
- (void)logDebug:(NSString *)msg info:(NSString *)info;

/**
 *  记录日志，会保存到本地日志文件中并在控制台打印输出（Error）.
 */
- (void)logError:(NSString *)msg info:(NSString *)info;

/**
 *  记录日志，会保存到本地日志文件中并在控制台打印输出（Warn）.
 */
- (void)logWarn:(NSString *)msg info:(NSString *)info;

@end

NS_ASSUME_NONNULL_END
