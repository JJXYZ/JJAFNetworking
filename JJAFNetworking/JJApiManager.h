//
//  JJApiManager.h
//  JJAFNetworking_Demo
//
//  Created by Jay on 15/12/17.
//  Copyright © 2015年 JJ. All rights reserved.
//

#import <Foundation/Foundation.h>



#define API_MANAGER [JJApiManager sharedInstance]

@class JJApi;
@interface JJApiManager : NSObject

#pragma mark - Lifecycle

+ (JJApiManager *)sharedInstance;

#pragma mark - Init

/** 设置最大请求队列数 */
- (void)setMaxConcurrentOperationCount:(NSUInteger)count;

/** 增加一个ContentType,例:@"text/plain" */
- (void)addAcceptableContentType:(NSString *)type;

#pragma mark - Public Methods

/** 当前请求队列中的个数 */
- (NSInteger)curOperationCount;

/** 发起请求 */
- (void)startApi:(JJApi *)api;

/** 取消请求 */
- (void)cancelApi:(JJApi *)api;

@end
